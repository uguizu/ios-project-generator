#!/bin/bash
# ─── Fastlane Automation Templates ───────────────────────────────────────────

generate_fastlane() {
    local base_dir="$1"

    mkdir -p "${base_dir}/fastlane"
    mkdir -p "${base_dir}/scripts"

    _generate_gemfile "$base_dir"
    _generate_appfile "$base_dir"
    _generate_matchfile "$base_dir"
    _generate_fastfile "$base_dir"
    _generate_scripts "$base_dir"
}

# ─── Gemfile ─────────────────────────────────────────────────────────────────

_generate_gemfile() {
    local base_dir="$1"

    cat <<'GEMFILE' > "${base_dir}/Gemfile"
source "https://rubygems.org"

gem "fastlane"
GEMFILE
}

# ─── Appfile ─────────────────────────────────────────────────────────────────

_generate_appfile() {
    local base_dir="$1"

    cat <<EOF > "${base_dir}/fastlane/Appfile"
app_identifier("${FULL_BUNDLE_ID}")
apple_id("") # TODO: Set your Apple ID email
team_id("")  # TODO: Set your Apple Developer Team ID
EOF
}

# ─── Matchfile ───────────────────────────────────────────────────────────────

_generate_matchfile() {
    local base_dir="$1"

    cat <<EOF > "${base_dir}/fastlane/Matchfile"
git_url("") # TODO: Set your certificates git repository URL

storage_mode("git")

type("appstore")

app_identifier([
  "${FULL_BUNDLE_ID}",
EOF

    if [[ "$QA_TARGET" == "yes" ]]; then
        cat <<EOF >> "${base_dir}/fastlane/Matchfile"
  "${FULL_BUNDLE_ID}.qa",
EOF
    fi

    if [[ "$DEV_TARGET" == "yes" ]]; then
        cat <<EOF >> "${base_dir}/fastlane/Matchfile"
  "${FULL_BUNDLE_ID}.dev",
EOF
    fi

    cat <<'EOF' >> "${base_dir}/fastlane/Matchfile"
])
EOF
}

# ─── Fastfile ────────────────────────────────────────────────────────────────

_generate_fastfile() {
    local base_dir="$1"

    cat <<EOF > "${base_dir}/fastlane/Fastfile"
default_platform(:ios)

platform :ios do

  # ─── Certificates & Provisioning ─────────────────────────────────────────

  desc "Download certificates and provisioning profiles"
  lane :certificates do
    match(type: "appstore")
    match(type: "development")
  end

  # ─── Build ───────────────────────────────────────────────────────────────

  desc "Build and generate IPA for the specified target"
  lane :build do |options|
    target = options[:target] || "${PROJECT_NAME}"
    configuration = options[:configuration] || "Release"

    sh("cd .. && xcodegen generate")

    build_app(
      scheme: target,
      configuration: configuration,
      clean: true,
      output_directory: "./build",
      output_name: "#{target}.ipa",
      export_method: "app-store"
    )
  end

  # ─── TestFlight ──────────────────────────────────────────────────────────

  desc "Push a build to TestFlight"
  lane :beta do |options|
    target = options[:target] || "${PROJECT_NAME}"

    build(target: target)

    upload_to_testflight(
      skip_waiting_for_build_processing: true
    )
  end

  # ─── Convenience Lanes ───────────────────────────────────────────────────

  desc "Build and upload Production to TestFlight"
  lane :production_beta do
    beta(target: "${PROJECT_NAME}")
  end
EOF

    if [[ "$QA_TARGET" == "yes" ]]; then
        cat <<EOF >> "${base_dir}/fastlane/Fastfile"

  desc "Build and upload QA to TestFlight"
  lane :qa_beta do
    beta(target: "${PROJECT_NAME}QA")
  end
EOF
    fi

    if [[ "$DEV_TARGET" == "yes" ]]; then
        cat <<EOF >> "${base_dir}/fastlane/Fastfile"

  desc "Build and upload Development to TestFlight"
  lane :dev_beta do
    beta(target: "${PROJECT_NAME}Dev")
  end
EOF
    fi

    cat <<'EOF' >> "${base_dir}/fastlane/Fastfile"

end
EOF
}

# ─── Wrapper Scripts ─────────────────────────────────────────────────────────

_generate_scripts() {
    local base_dir="$1"

    _generate_script_setup "$base_dir"
    _generate_script_certificates "$base_dir"
    _generate_script_build "$base_dir"
    _generate_script_testflight "$base_dir"

    chmod +x "${base_dir}/scripts/"*.sh
}

_generate_script_setup() {
    local base_dir="$1"

    cat <<'SCRIPT' > "${base_dir}/scripts/setup.sh"
#!/bin/bash
set -euo pipefail

# ─── Setup ───────────────────────────────────────────────────────────────────
# Installs all project dependencies.
#
# Usage:
#   ./scripts/setup.sh
# ─────────────────────────────────────────────────────────────────────────────

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m'

echo ""
echo -e "${BOLD}Setting up project...${NC}"
echo ""

# Check xcodegen
if command -v xcodegen &> /dev/null; then
    echo -e "${GREEN}✔${NC} xcodegen found"
else
    echo -e "${RED}✘${NC} xcodegen not found"
    echo "  Install with: brew install xcodegen"
    exit 1
fi

# Check bundler
if command -v bundle &> /dev/null; then
    echo -e "${GREEN}✔${NC} bundler found"
else
    echo -e "${YELLOW}⚠${NC} bundler not found — installing..."
    gem install bundler
fi

# Install Ruby dependencies (Fastlane)
echo ""
echo -e "${BOLD}Installing Fastlane...${NC}"
bundle install

# Generate Xcode project
echo ""
echo -e "${BOLD}Generating Xcode project...${NC}"
xcodegen generate

echo ""
echo -e "${GREEN}✔ Setup complete!${NC}"
echo ""
echo "Next steps:"
echo "  1. Open the project:     open *.xcodeproj"
echo "  2. Fetch certificates:   ./scripts/certificates.sh"
echo ""
SCRIPT
}

_generate_script_certificates() {
    local base_dir="$1"

    cat <<'SCRIPT' > "${base_dir}/scripts/certificates.sh"
#!/bin/bash
set -euo pipefail

# ─── Certificates ────────────────────────────────────────────────────────────
# Downloads signing certificates and provisioning profiles.
# Uses Fastlane Match to sync from a shared git repository.
#
# Prerequisites:
#   1. Run ./scripts/setup.sh first
#   2. Configure fastlane/Matchfile with your certificates git repo URL
#   3. Configure fastlane/Appfile with your Apple ID and Team ID
#
# Usage:
#   ./scripts/certificates.sh
# ─────────────────────────────────────────────────────────────────────────────

echo ""
echo "Downloading certificates and provisioning profiles..."
echo ""

bundle exec fastlane certificates

echo ""
echo "Done! Certificates are installed and ready to use."
echo ""
SCRIPT
}

_generate_script_build() {
    local base_dir="$1"

    cat <<SCRIPT > "${base_dir}/scripts/build.sh"
#!/bin/bash
set -euo pipefail

# ─── Build ───────────────────────────────────────────────────────────────────
# Builds the app and generates an IPA file.
# Output is saved to the ./build/ directory.
#
# Usage:
#   ./scripts/build.sh                    # Build Production target
#   ./scripts/build.sh ${PROJECT_NAME}QA  # Build QA target
#   ./scripts/build.sh ${PROJECT_NAME}Dev # Build Development target
# ─────────────────────────────────────────────────────────────────────────────

TARGET="\${1:-${PROJECT_NAME}}"

echo ""
echo "Building \${TARGET}..."
echo ""

bundle exec fastlane build target:"\${TARGET}"

echo ""
echo "Done! IPA is in the ./build/ directory."
echo ""
SCRIPT
}

_generate_script_testflight() {
    local base_dir="$1"

    cat <<SCRIPT > "${base_dir}/scripts/testflight.sh"
#!/bin/bash
set -euo pipefail

# ─── TestFlight ──────────────────────────────────────────────────────────────
# Builds the app and uploads it to TestFlight.
#
# Usage:
#   ./scripts/testflight.sh                    # Upload Production target
#   ./scripts/testflight.sh ${PROJECT_NAME}QA  # Upload QA target
#   ./scripts/testflight.sh ${PROJECT_NAME}Dev # Upload Development target
# ─────────────────────────────────────────────────────────────────────────────

TARGET="\${1:-${PROJECT_NAME}}"

echo ""
echo "Building and uploading \${TARGET} to TestFlight..."
echo ""

bundle exec fastlane beta target:"\${TARGET}"

echo ""
echo "Done! Build has been uploaded to TestFlight."
echo ""
SCRIPT
}
