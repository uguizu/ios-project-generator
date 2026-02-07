#!/bin/bash
set -euo pipefail

# ─── Colors & Formatting ──────────────────────────────────────────────────────

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m' # No Color

print_banner() {
    echo ""
    echo -e "${BOLD}╔══════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}║     iOS Project Generator (XcodeGen)     ║${NC}"
    echo -e "${BOLD}╚══════════════════════════════════════════╝${NC}"
    echo ""
}

print_success() {
    echo -e "${GREEN}✔ $1${NC}"
}

print_error() {
    echo -e "${RED}✘ $1${NC}"
}

print_info() {
    echo -e "${CYAN}ℹ $1${NC}"
}

print_step() {
    echo -e "${BOLD}[$1/$2]${NC} $3"
}

# ─── Validation ────────────────────────────────────────────────────────────────

validate_project_name() {
    local name="$1"
    if [[ ! "$name" =~ ^[A-Za-z][A-Za-z0-9_]*$ ]]; then
        print_error "Project name must start with a letter and contain only letters, numbers, and underscores."
        return 1
    fi
    local reserved
    for reserved in Test Tests Build DerivedData Pods Packages; do
        if [[ "$name" == "$reserved" ]]; then
            print_error "Project name '$name' is reserved. Please choose another name."
            return 1
        fi
    done
    return 0
}

validate_bundle_id_prefix() {
    local bid="$1"
    if [[ ! "$bid" =~ ^[a-zA-Z][a-zA-Z0-9-]*(\.[a-zA-Z][a-zA-Z0-9-]*)+$ ]]; then
        print_error "Bundle ID prefix must be in reverse domain notation (e.g., com.example)."
        return 1
    fi
    return 0
}

validate_deployment_target() {
    local target="$1"
    if [[ ! "$target" =~ ^[0-9]+\.[0-9]+$ ]]; then
        print_error "Deployment target must be in format X.Y (e.g., 17.0)."
        return 1
    fi
    local major="${target%%.*}"
    if [ "$major" -lt 15 ]; then
        print_error "Deployment target must be iOS 15.0 or higher for SwiftUI app lifecycle."
        return 1
    fi
    return 0
}

validate_swift_version() {
    local version="$1"
    if [[ "$version" != "5" && "$version" != "6" ]]; then
        print_error "Swift version must be 5 or 6."
        return 1
    fi
    return 0
}

# ─── Prompt Helper ─────────────────────────────────────────────────────────────

prompt_with_default() {
    local prompt_message="$1"
    local default_value="$2"
    local input
    read -r -p "  ${prompt_message} [${default_value}]: " input
    echo "${input:-$default_value}"
}

# ─── Input Collection ──────────────────────────────────────────────────────────

collect_inputs() {
    echo -e "${BOLD}Project Configuration${NC}"
    echo "Answer the following questions (press Enter to accept defaults)."
    echo ""

    # Project Name
    while true; do
        PROJECT_NAME=$(prompt_with_default "Project name" "MyApp")
        if validate_project_name "$PROJECT_NAME"; then
            break
        fi
    done

    # Organization Name
    while true; do
        ORG_NAME=$(prompt_with_default "Organization name" "MyOrganization")
        if [[ -n "$ORG_NAME" ]]; then
            break
        fi
        print_error "Organization name cannot be empty."
    done

    # Bundle ID Prefix
    local default_bundle_id
    default_bundle_id="com.$(echo "$ORG_NAME" | tr '[:upper:]' '[:lower:]' | tr -d ' ' | tr -cd 'a-z0-9')"
    while true; do
        BUNDLE_ID_PREFIX=$(prompt_with_default "Bundle ID prefix" "$default_bundle_id")
        if validate_bundle_id_prefix "$BUNDLE_ID_PREFIX"; then
            break
        fi
    done

    # Deployment Target
    while true; do
        DEPLOYMENT_TARGET=$(prompt_with_default "iOS deployment target" "17.0")
        if validate_deployment_target "$DEPLOYMENT_TARGET"; then
            break
        fi
    done

    # Swift Version
    while true; do
        SWIFT_VERSION=$(prompt_with_default "Swift language version (5 or 6)" "6")
        if validate_swift_version "$SWIFT_VERSION"; then
            break
        fi
    done

    # Output Directory
    OUTPUT_DIR=$(prompt_with_default "Output directory" ".")

    # Derived values
    PROJECT_NAME_LOWER=$(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]')
    FULL_BUNDLE_ID="${BUNDLE_ID_PREFIX}.${PROJECT_NAME_LOWER}"

    # Confirmation
    echo ""
    echo -e "${BOLD}┌─────────────────────────────────────────────┐${NC}"
    echo -e "${BOLD}│ Project Configuration Summary               │${NC}"
    echo -e "${BOLD}├─────────────────────────────────────────────┤${NC}"
    printf "│ %-18s %-25s│\n" "Project Name:" "$PROJECT_NAME"
    printf "│ %-18s %-25s│\n" "Organization:" "$ORG_NAME"
    printf "│ %-18s %-25s│\n" "Bundle ID Prefix:" "$BUNDLE_ID_PREFIX"
    printf "│ %-18s %-25s│\n" "Deployment Target:" "iOS $DEPLOYMENT_TARGET"
    printf "│ %-18s %-25s│\n" "Swift Version:" "$SWIFT_VERSION"
    printf "│ %-18s %-25s│\n" "Output Directory:" "$OUTPUT_DIR/$PROJECT_NAME"
    printf "│ %-18s %-25s│\n" "Full Bundle ID:" "$FULL_BUNDLE_ID"
    echo -e "${BOLD}└─────────────────────────────────────────────┘${NC}"
    echo ""

    local proceed
    read -r -p "  Proceed with these settings? [Y/n]: " proceed
    if [[ "${proceed:-Y}" =~ ^[Nn]$ ]]; then
        echo "Aborted."
        exit 0
    fi
}

# ─── Directory Structure ──────────────────────────────────────────────────────

create_directory_structure() {
    local base_dir="$1"

    if [[ -d "$base_dir" ]]; then
        print_error "Directory '$base_dir' already exists."
        local overwrite
        read -r -p "  Overwrite? [y/N]: " overwrite
        if [[ ! "${overwrite:-N}" =~ ^[Yy]$ ]]; then
            echo "Aborted."
            exit 1
        fi
        rm -rf "$base_dir"
    fi

    mkdir -p "${base_dir}/Sources/${PROJECT_NAME}"
    mkdir -p "${base_dir}/Sources/${PROJECT_NAME}/Assets.xcassets/AccentColor.colorset"
    mkdir -p "${base_dir}/Sources/${PROJECT_NAME}/Assets.xcassets/AppIcon.appiconset"
    mkdir -p "${base_dir}/Sources/${PROJECT_NAME}/Preview Content/Preview Assets.xcassets"
    mkdir -p "${base_dir}/Tests/${PROJECT_NAME}Tests"
    mkdir -p "${base_dir}/UITests/${PROJECT_NAME}UITests"
}

# ─── project.yml ──────────────────────────────────────────────────────────────

generate_project_yml() {
    local base_dir="$1"

    cat <<EOF > "${base_dir}/project.yml"
name: ${PROJECT_NAME}

configs:
  Debug: debug
  Release: release

settings:
  base:
    SWIFT_VERSION: "${SWIFT_VERSION}"
    IPHONEOS_DEPLOYMENT_TARGET: "${DEPLOYMENT_TARGET}"
    MARKETING_VERSION: "1.0.0"
    CURRENT_PROJECT_VERSION: 1
    GENERATE_INFOPLIST_FILE: YES
    SWIFT_EMIT_LOC_STRINGS: YES
    DEVELOPMENT_TEAM: ""
  configs:
    Debug:
      SWIFT_OPTIMIZATION_LEVEL: "-Onone"
      DEBUG_INFORMATION_FORMAT: "dwarf-with-dsym"
      SWIFT_ACTIVE_COMPILATION_CONDITIONS: "DEBUG"
    Release:
      SWIFT_OPTIMIZATION_LEVEL: "-Owholemodule"
      DEBUG_INFORMATION_FORMAT: "dwarf-with-dsym"
      SWIFT_COMPILATION_MODE: "wholemodule"

targets:
  ${PROJECT_NAME}:
    type: application
    platform: iOS
    deploymentTarget: "${DEPLOYMENT_TARGET}"
    sources:
      - path: Sources/${PROJECT_NAME}
    settings:
      base:
        PRODUCT_BUNDLE_IDENTIFIER: ${FULL_BUNDLE_ID}
        INFOPLIST_KEY_UIApplicationSceneManifest_Generation: YES
        INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents: YES
        INFOPLIST_KEY_UILaunchScreen_Generation: YES
        INFOPLIST_KEY_UISupportedInterfaceOrientations_iPad: "UIInterfaceOrientationPortrait UIInterfaceOrientationPortraitUpsideDown UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight"
        INFOPLIST_KEY_UISupportedInterfaceOrientations_iPhone: "UIInterfaceOrientationPortrait UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight"
        ASSETCATALOG_COMPILER_APPICON_NAME: AppIcon
        ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME: AccentColor
        CODE_SIGN_STYLE: Automatic
        ENABLE_PREVIEWS: YES
    info:
      path: Sources/${PROJECT_NAME}/Info.plist
      properties:
        CFBundleDisplayName: ${PROJECT_NAME}
        CFBundleShortVersionString: "\$(MARKETING_VERSION)"
        CFBundleVersion: "\$(CURRENT_PROJECT_VERSION)"
        UILaunchScreen: {}
    scheme:
      testTargets:
        - ${PROJECT_NAME}Tests
        - ${PROJECT_NAME}UITests
      gatherCoverageData: true

  ${PROJECT_NAME}Tests:
    type: bundle.unit-test
    platform: iOS
    deploymentTarget: "${DEPLOYMENT_TARGET}"
    sources:
      - path: Tests/${PROJECT_NAME}Tests
    dependencies:
      - target: ${PROJECT_NAME}
    settings:
      base:
        PRODUCT_BUNDLE_IDENTIFIER: ${BUNDLE_ID_PREFIX}.${PROJECT_NAME_LOWER}tests
        BUNDLE_LOADER: "\$(TEST_HOST)"
        TEST_HOST: "\$(BUILT_PRODUCTS_DIR)/${PROJECT_NAME}.app/\$(BUNDLE_EXECUTABLE_FOLDER_PATH)/${PROJECT_NAME}"

  ${PROJECT_NAME}UITests:
    type: bundle.ui-testing
    platform: iOS
    deploymentTarget: "${DEPLOYMENT_TARGET}"
    sources:
      - path: UITests/${PROJECT_NAME}UITests
    dependencies:
      - target: ${PROJECT_NAME}
    settings:
      base:
        PRODUCT_BUNDLE_IDENTIFIER: ${BUNDLE_ID_PREFIX}.${PROJECT_NAME_LOWER}uitests
        TEST_TARGET_NAME: ${PROJECT_NAME}

schemes:
  ${PROJECT_NAME}:
    build:
      targets:
        ${PROJECT_NAME}: all
        ${PROJECT_NAME}Tests: [test]
        ${PROJECT_NAME}UITests: [test]
    run:
      config: Debug
    test:
      config: Debug
      gatherCoverageData: true
      targets:
        - name: ${PROJECT_NAME}Tests
          parallelizable: true
          randomExecutionOrder: true
        - name: ${PROJECT_NAME}UITests
          parallelizable: true
          randomExecutionOrder: true
    profile:
      config: Release
    analyze:
      config: Debug
    archive:
      config: Release
EOF
}

# ─── .gitignore ───────────────────────────────────────────────────────────────

generate_gitignore() {
    local base_dir="$1"

    cat <<'GITIGNORE' > "${base_dir}/.gitignore"
# Xcode
xcuserdata/
DerivedData/
*.hmap
*.ipa
*.dSYM.zip
*.dSYM
build/

# XcodeGen — project is generated from project.yml
*.xcodeproj

# Swift Package Manager
.build/
.swiftpm/
Package.resolved

# macOS
.DS_Store
.AppleDouble
.LSOverride
._*

# CocoaPods (if ever adopted)
Pods/

# Fastlane
fastlane/report.xml
fastlane/Preview.html
fastlane/screenshots/**/*.png
fastlane/test_output

# Secrets / Environment
.env
*.xcconfig.local

# Misc
*.moved-aside
*.pbxuser
!default.pbxuser
*.mode1v3
!default.mode1v3
*.mode2v3
!default.mode2v3
*.perspectivev3
!default.perspectivev3
GITIGNORE
}

# ─── SwiftUI Source Files ─────────────────────────────────────────────────────

generate_app_swift() {
    local base_dir="$1"

    cat <<EOF > "${base_dir}/Sources/${PROJECT_NAME}/${PROJECT_NAME}App.swift"
import SwiftUI

@main
struct ${PROJECT_NAME}App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
EOF
}

generate_content_view() {
    local base_dir="$1"
    local major="${DEPLOYMENT_TARGET%%.*}"

    if [ "$major" -ge 17 ]; then
        cat <<EOF > "${base_dir}/Sources/${PROJECT_NAME}/ContentView.swift"
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
EOF
    else
        cat <<EOF > "${base_dir}/Sources/${PROJECT_NAME}/ContentView.swift"
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
EOF
    fi
}

generate_assets() {
    local base_dir="$1"
    local assets_dir="${base_dir}/Sources/${PROJECT_NAME}/Assets.xcassets"

    # Root Contents.json
    cat <<'JSON' > "${assets_dir}/Contents.json"
{
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
JSON

    # AccentColor
    cat <<'JSON' > "${assets_dir}/AccentColor.colorset/Contents.json"
{
  "colors" : [
    {
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
JSON

    # AppIcon
    cat <<'JSON' > "${assets_dir}/AppIcon.appiconset/Contents.json"
{
  "images" : [
    {
      "idiom" : "universal",
      "platform" : "ios",
      "size" : "1024x1024"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
JSON

    # Preview Assets
    cat <<'JSON' > "${base_dir}/Sources/${PROJECT_NAME}/Preview Content/Preview Assets.xcassets/Contents.json"
{
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
JSON
}

# ─── Test Files ───────────────────────────────────────────────────────────────

generate_unit_tests() {
    local base_dir="$1"

    if [[ "$SWIFT_VERSION" == "6" ]]; then
        cat <<EOF > "${base_dir}/Tests/${PROJECT_NAME}Tests/${PROJECT_NAME}Tests.swift"
import Testing
@testable import ${PROJECT_NAME}

struct ${PROJECT_NAME}Tests {
    @Test func example() async throws {
        #expect(true)
    }
}
EOF
    else
        cat <<EOF > "${base_dir}/Tests/${PROJECT_NAME}Tests/${PROJECT_NAME}Tests.swift"
import XCTest
@testable import ${PROJECT_NAME}

final class ${PROJECT_NAME}Tests: XCTestCase {
    func testExample() throws {
        XCTAssertTrue(true)
    }
}
EOF
    fi
}

generate_ui_tests() {
    local base_dir="$1"

    cat <<EOF > "${base_dir}/UITests/${PROJECT_NAME}UITests/${PROJECT_NAME}UITests.swift"
import XCTest

final class ${PROJECT_NAME}UITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testAppLaunches() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.staticTexts["Hello, world!"].exists)
    }
}
EOF
}

# ─── CLAUDE.md ────────────────────────────────────────────────────────────────

generate_claude_md() {
    local base_dir="$1"

    cat <<EOF > "${base_dir}/CLAUDE.md"
# CLAUDE.md - Project Intelligence for ${PROJECT_NAME}

## Project Overview
${PROJECT_NAME} is an iOS application built with SwiftUI targeting iOS ${DEPLOYMENT_TARGET}+.

## First Principles — What We Do NOT Do
- **No UIKit** — SwiftUI only. No Storyboards, no XIBs, no UIKit view controllers.
- **No CocoaPods / Carthage** — Use Swift Package Manager exclusively for dependencies.
- **No manual .xcodeproj edits** — Always modify \`project.yml\` and run \`xcodegen generate\`.

## Build System
- **Project Generation**: XcodeGen (\`project.yml\` is the source of truth)
- Regenerate project: \`xcodegen generate\`
- Open project: \`open ${PROJECT_NAME}.xcodeproj\`

## Architecture
- SwiftUI app lifecycle (@main)
- Source files: \`Sources/${PROJECT_NAME}/\`
- Unit tests: \`Tests/${PROJECT_NAME}Tests/\`
- UI tests: \`UITests/${PROJECT_NAME}UITests/\`

## Build & Test Commands
\`\`\`bash
# Build
xcodebuild -scheme ${PROJECT_NAME} -configuration Debug build

# Run all tests
xcodebuild -scheme ${PROJECT_NAME} -configuration Debug \\
  -destination 'platform=iOS Simulator,name=iPhone 16' test

# Run a single test
xcodebuild test -scheme ${PROJECT_NAME} \\
  -only-testing:${PROJECT_NAME}Tests/TestClassName/testMethodName
\`\`\`

## Conventions
- Swift ${SWIFT_VERSION}
- Use SwiftUI for all UI
- Follow Swift API Design Guidelines
- Keep views small and composable
- Use MVVM pattern for view models
EOF

    if [[ "$SWIFT_VERSION" == "6" ]]; then
        cat <<EOF >> "${base_dir}/CLAUDE.md"
- Use Swift Testing framework for unit tests (\`import Testing\`, \`@Test\`, \`#expect\`)
- Use XCTest / XCUITest for UI tests
EOF
    else
        cat <<EOF >> "${base_dir}/CLAUDE.md"
- Use XCTest for unit tests (\`XCTestCase\`, \`XCTAssert\`)
- Use XCTest / XCUITest for UI tests
EOF
    fi

    cat <<EOF >> "${base_dir}/CLAUDE.md"

## Dependencies
- Managed via Swift Package Manager
- Add packages to the \`packages\` section in \`project.yml\`, then run \`xcodegen generate\`

## Key Files
- \`project.yml\` — XcodeGen project specification (SOURCE OF TRUTH)
- \`Sources/${PROJECT_NAME}/${PROJECT_NAME}App.swift\` — App entry point
- \`Sources/${PROJECT_NAME}/ContentView.swift\` — Main content view
EOF
}

# ─── Post-Generation ──────────────────────────────────────────────────────────

init_git_repo() {
    local base_dir="$1"
    local init_git
    read -r -p "  Initialize git repository? [Y/n]: " init_git
    if [[ "${init_git:-Y}" =~ ^[Yy]$ ]]; then
        (
            cd "$base_dir"
            git init -q
            git add .
            git commit -q -m "Initial project setup generated by ios-start-script"
        )
        print_success "Git repository initialized with initial commit."
    fi
}

print_summary() {
    local base_dir="$1"

    echo ""
    echo -e "${BOLD}══════════════════════════════════════════${NC}"
    print_success "Project '${PROJECT_NAME}' generated successfully!"
    echo -e "${BOLD}══════════════════════════════════════════${NC}"
    echo ""
    echo "Next steps:"
    echo "  1. cd ${base_dir}"
    echo "  2. xcodegen generate"
    echo "  3. open ${PROJECT_NAME}.xcodeproj"
    echo ""

    if ! command -v xcodegen &> /dev/null; then
        echo -e "${YELLOW}Note: xcodegen is not installed. Install it with:${NC}"
        echo "    brew install xcodegen"
        echo ""
    fi
}

# ─── Main ─────────────────────────────────────────────────────────────────────

main() {
    local total_steps=8

    print_banner
    collect_inputs

    local base_dir="${OUTPUT_DIR}/${PROJECT_NAME}"

    echo ""
    print_step 1 $total_steps "Creating directory structure..."
    create_directory_structure "$base_dir"
    print_success "Directory structure created."

    print_step 2 $total_steps "Generating project.yml..."
    generate_project_yml "$base_dir"
    print_success "project.yml generated."

    print_step 3 $total_steps "Generating .gitignore..."
    generate_gitignore "$base_dir"
    print_success ".gitignore generated."

    print_step 4 $total_steps "Generating SwiftUI app entry point..."
    generate_app_swift "$base_dir"
    print_success "${PROJECT_NAME}App.swift generated."

    print_step 5 $total_steps "Generating ContentView and assets..."
    generate_content_view "$base_dir"
    generate_assets "$base_dir"
    print_success "ContentView.swift and asset catalogs generated."

    print_step 6 $total_steps "Generating test files..."
    generate_unit_tests "$base_dir"
    generate_ui_tests "$base_dir"
    print_success "Unit test and UI test files generated."

    print_step 7 $total_steps "Generating CLAUDE.md..."
    generate_claude_md "$base_dir"
    print_success "CLAUDE.md generated."

    print_step 8 $total_steps "Finalizing..."
    init_git_repo "$base_dir"

    print_summary "$base_dir"
}

main
