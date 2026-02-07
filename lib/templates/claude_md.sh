#!/bin/bash
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
