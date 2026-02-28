#!/bin/bash
# ─── README.md ───────────────────────────────────────────────────────────────

generate_readme() {
    local base_dir="$1"

    cat <<EOF > "${base_dir}/README.md"
# ${DISPLAY_NAME}

${PROJECT_NAME} is an iOS application built with SwiftUI targeting iOS ${DEPLOYMENT_TARGET}+.

## Prerequisites

- macOS with Xcode installed
- [XcodeGen](https://github.com/yonaskolb/XcodeGen) — \`brew install xcodegen\`
EOF

    if [[ "$FASTLANE" == "yes" ]]; then
        cat <<'EOF' >> "${base_dir}/README.md"
- Ruby (ships with macOS) and Bundler — `gem install bundler`
EOF
    fi

    cat <<EOF >> "${base_dir}/README.md"

## Getting Started

EOF

    if [[ "$FASTLANE" == "yes" ]]; then
        cat <<EOF >> "${base_dir}/README.md"
Run the setup script to install dependencies and generate the Xcode project:

\`\`\`bash
./scripts/setup.sh
open ${PROJECT_NAME}.xcodeproj
\`\`\`

Or do it manually:

\`\`\`bash
bundle install
xcodegen generate
open ${PROJECT_NAME}.xcodeproj
\`\`\`
EOF
    else
        cat <<EOF >> "${base_dir}/README.md"
\`\`\`bash
xcodegen generate
open ${PROJECT_NAME}.xcodeproj
\`\`\`
EOF
    fi

    # Scripts section (only when Fastlane is enabled)
    if [[ "$FASTLANE" == "yes" ]]; then
        cat <<EOF >> "${base_dir}/README.md"

## Scripts

Simple commands for common tasks. No Fastlane knowledge required.

| Script | What it does |
|--------|-------------|
| \`./scripts/setup.sh\` | Install dependencies and generate Xcode project |
| \`./scripts/certificates.sh\` | Download signing certificates and provisioning profiles |
| \`./scripts/build.sh\` | Build the app and generate an IPA file |
| \`./scripts/testflight.sh\` | Build and upload to TestFlight |

### First-Time Setup

Before using the build/upload scripts, you need to configure signing:

1. **Run setup:**
   \`\`\`bash
   ./scripts/setup.sh
   \`\`\`

2. **Configure your Apple credentials** — edit these files:
   - \`fastlane/Appfile\` — Set your Apple ID and Team ID
   - \`fastlane/Matchfile\` — Set your certificates git repository URL

3. **Fetch certificates:**
   \`\`\`bash
   ./scripts/certificates.sh
   \`\`\`

### Building

\`\`\`bash
# Build Production IPA
./scripts/build.sh

# Build a specific target
./scripts/build.sh ${PROJECT_NAME}QA
./scripts/build.sh ${PROJECT_NAME}Dev
\`\`\`

The IPA file is saved to the \`./build/\` directory.

### Uploading to TestFlight

\`\`\`bash
# Upload Production to TestFlight
./scripts/testflight.sh

# Upload a specific target
./scripts/testflight.sh ${PROJECT_NAME}QA
./scripts/testflight.sh ${PROJECT_NAME}Dev
\`\`\`
EOF
    fi

    # Targets section
    cat <<EOF >> "${base_dir}/README.md"

## Targets

| Target | Bundle ID | Display Name |
|--------|-----------|-------------|
| Production | \`${FULL_BUNDLE_ID}\` | ${DISPLAY_NAME} |
EOF

    if [[ "$QA_TARGET" == "yes" ]]; then
        cat <<EOF >> "${base_dir}/README.md"
| QA | \`${FULL_BUNDLE_ID}.qa\` | ${DISPLAY_NAME} QA |
EOF
    fi

    if [[ "$DEV_TARGET" == "yes" ]]; then
        cat <<EOF >> "${base_dir}/README.md"
| Development | \`${FULL_BUNDLE_ID}.dev\` | ${DISPLAY_NAME} Dev |
EOF
    fi

    cat <<EOF >> "${base_dir}/README.md"

Each target has its own xcconfig file in \`Sources/Configuration/\` with environment-specific values (API URL, display name). All targets can coexist on the same device.

## Project Structure

\`\`\`
Sources/
├── ${PROJECT_NAME}App.swift              # App entry point
├── Modules/Root/                         # SwiftUI views
├── Core/
│   ├── Network/NetworkClient.swift       # HTTP client
│   ├── Services/Sample/                  # API service example
│   ├── Models/                           # Data models
│   └── Utils/Configuration.swift         # Config access
├── Resources/                            # Colors, assets
└── Configuration/                        # xcconfig files
Tests/                                    # Unit tests
UITests/                                  # UI tests
\`\`\`

## Build Commands

\`\`\`bash
# Regenerate Xcode project after editing project.yml
xcodegen generate

# Build from command line
xcodebuild -scheme ${PROJECT_NAME} -configuration Debug build

# Run tests
xcodebuild -scheme ${PROJECT_NAME} -configuration Debug \\
  -destination 'platform=iOS Simulator,name=iPhone 16' test
\`\`\`
EOF
}
