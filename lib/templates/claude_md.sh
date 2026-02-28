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
- \`Sources/\` — App entry point (\`${PROJECT_NAME}App.swift\`)
- \`Sources/Modules/Root/\` — Root views (SwiftUI)
- \`Sources/Core/Network/\` — Network client (struct-based, protocol-oriented)
- \`Sources/Core/Services/[ServiceName]/\` — Service implementations, protocols, and API definitions
- \`Sources/Core/Models/\` — Shared data models
- \`Sources/Core/Utils/\` — Utility classes and configuration access
- \`Sources/Resources/\` — Material 3 color system, images, and asset catalogs
- \`Sources/Configuration/\` — Target-specific xcconfig files and generated Info.plist
- \`Tests/${PROJECT_NAME}Tests/\` — Unit tests
- \`UITests/${PROJECT_NAME}UITests/\` — UI tests

## Network Layer

The network layer uses a **struct-based, protocol-oriented** design for lightweight, testable API clients.

### Architecture
- **Endpoint Protocol**: Type-safe API endpoint definitions
- **NetworkClient (struct)**: Immutable configuration with URLSession, async/await
- **Service Structs**: Lightweight service implementations with dependency injection
- **MockNetworkClient (class)**: Simple mock for unit tests with mutable state
- **Service Folders**: Each service in \`Core/Services/[ServiceName]/\` with protocol, implementation, and API

### Benefits of Struct-Based Design
- **Value semantics**: Immutable configuration, safer concurrency
- **Performance**: Stack allocation, reduced reference counting overhead
- **Testability**: Protocol-based dependency injection, easy mocking
- **Composition**: Protocol extensions for shared behavior
- **Modern Swift**: Aligned with async/await and actor concurrency

### Adding a New Service

1. Create service folder: \`Sources/Core/Services/User/\`

2. Define API endpoints (\`UserAPI.swift\`):
\`\`\`swift
enum UserAPI {
    case login(email: String, password: String)
}

extension UserAPI: Endpoint {
    var baseURL: URL { URL(string: "https://api.example.com")! }
    var path: String {
        switch self {
        case .login: return "/auth/login"
        }
    }
    var method: HTTPMethod { .post }
    var task: HTTPTask {
        case .login(let email, let password):
            return .requestJSON(LoginRequest(email: email, password: password))
    }
}
\`\`\`

3. Define protocol (\`UserServiceProtocol.swift\`):
\`\`\`swift
protocol UserServiceProtocol {
    func login(email: String, password: String) async throws -> UserModel
}
\`\`\`

4. Implement service (\`UserService.swift\`):
\`\`\`swift
struct UserService: UserServiceProtocol {
    let networkClient: NetworkClientProtocol

    init(networkClient: NetworkClientProtocol = NetworkClient()) {
        self.networkClient = networkClient
    }

    func login(email: String, password: String) async throws -> UserModel {
        let response: LoginResponse = try await networkClient.request(
            UserAPI.login(email: email, password: password)
        )
        return UserModel(from: response)
    }
}
\`\`\`

### File Uploads (Multipart)

\`\`\`swift
case uploadPhoto(image: Data):
    let part = MultipartFormData.image(image, name: "photo")
    return .uploadMultipart([part])
\`\`\`

### Testing

Inject \`MockNetworkClient\` for unit tests:
\`\`\`swift
let mockClient = MockNetworkClient()
mockClient.mockResponse = [/* test data */]
let service = SampleService(networkClient: mockClient)

let result = try await service.fetchSamples()
XCTAssertEqual(mockClient.requestCallCount, 1)
\`\`\`

## Configuration

Application configuration values are managed through xcconfig files and accessed via the \`Configuration\` enum.

### Accessing Configuration Values

\`\`\`swift
import Foundation

// Get base URL for API requests
let baseURL = Configuration.baseURL  // "https://api.example.com"
\`\`\`

### Setting Configuration Values

Edit the target-specific xcconfig files in \`Sources/Configuration/\`:

1. \`Production.xcconfig\` — Production target:
\`\`\`
API_BASE_URL = https:/\$()/api.example.com
APP_DISPLAY_NAME = ${DISPLAY_NAME}
\`\`\`

Values are automatically injected into Info.plist during build via \`project.yml\`.
Each target (Production, QA, Development) has its own xcconfig with environment-specific values.

### Usage in Services

\`\`\`swift
extension SampleAPI: Endpoint {
    var baseURL: URL {
        URL(string: Configuration.baseURL)!
    }
    // ...
}
\`\`\`

## Build & Test Commands
\`\`\`bash
# Build Production
xcodebuild -scheme ${PROJECT_NAME} -configuration Debug build

# Run all tests
xcodebuild -scheme ${PROJECT_NAME} -configuration Debug \\
  -destination 'platform=iOS Simulator,name=iPhone 16' test

# Run a single test
xcodebuild test -scheme ${PROJECT_NAME} \\
  -only-testing:${PROJECT_NAME}Tests/TestClassName/testMethodName
EOF

    # NOTE: markdown code fence left open above; QA/Dev commands appended conditionally, closed below
    if [[ "$QA_TARGET" == "yes" ]]; then
        cat <<EOF >> "${base_dir}/CLAUDE.md"

# Build QA target
xcodebuild -scheme ${PROJECT_NAME}QA -configuration Debug build
EOF
    fi

    if [[ "$DEV_TARGET" == "yes" ]]; then
        cat <<EOF >> "${base_dir}/CLAUDE.md"

# Build Development target
xcodebuild -scheme ${PROJECT_NAME}Dev -configuration Debug build
EOF
    fi

    cat <<EOF >> "${base_dir}/CLAUDE.md"
\`\`\`

## Conventions
- Swift ${SWIFT_VERSION}
- Use SwiftUI for all UI
- Follow Swift API Design Guidelines
- Keep views small and composable
- Use MVVM pattern for view models
- Use Material Design 3 color tokens for all colors (\`ThemeColors\` for UIKit, \`Color.Theme\` for SwiftUI)
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

## Git Conventions

This project uses [Conventional Commits](https://www.conventionalcommits.org/) for all commit messages.

### Format
\`\`\`
<type>(<scope>): <description>

[optional body]

[optional footer]
\`\`\`

### Types
- \`feat\`: New feature
- \`fix\`: Bug fix
- \`docs\`: Documentation changes
- \`style\`: Code style changes (formatting, missing semicolons, etc.)
- \`refactor\`: Code refactoring without changing functionality
- \`test\`: Adding or updating tests
- \`chore\`: Maintenance tasks, dependency updates
- \`build\`: Build system or external dependency changes
- \`ci\`: CI/CD configuration changes
- \`perf\`: Performance improvements

### Examples
\`\`\`bash
feat(auth): add biometric authentication
fix(network): handle timeout errors correctly
docs(readme): update installation instructions
refactor(network): convert NetworkClient to struct
test(service): add unit tests for UserService
\`\`\`

### Scope
The scope is optional but recommended. Common scopes:
- \`auth\`, \`network\`, \`ui\`, \`api\`, \`config\`, \`test\`, \`build\`

## Dependencies
- Managed via Swift Package Manager
- Add packages to the \`packages\` section in \`project.yml\`, then run \`xcodegen generate\`

## Key Files
- \`project.yml\` — XcodeGen project specification (SOURCE OF TRUTH)
- \`Sources/${PROJECT_NAME}App.swift\` — App entry point
- \`Sources/Modules/Root/ContentView.swift\` — Main content view
- \`Sources/Core/Network/NetworkClient.swift\` — Struct-based network client
- \`Sources/Core/Services/Sample/\` — Sample service implementation (API, protocol, service)
- \`Sources/Core/Models/SampleModel.swift\` — Sample data model
- \`Sources/Core/Utils/Configuration.swift\` — Configuration enum for accessing Info.plist values
- \`Sources/Configuration/Production.xcconfig\` — Production target configuration (API URLs, display name)
EOF

    if [[ "$QA_TARGET" == "yes" ]]; then
        cat <<EOF >> "${base_dir}/CLAUDE.md"
- \`Sources/Configuration/QA.xcconfig\` — QA target configuration
EOF
    fi

    if [[ "$DEV_TARGET" == "yes" ]]; then
        cat <<EOF >> "${base_dir}/CLAUDE.md"
- \`Sources/Configuration/Development.xcconfig\` — Development target configuration
EOF
    fi

    cat <<EOF >> "${base_dir}/CLAUDE.md"
- \`Sources/Resources/ThemeColors.swift\` — Material 3 UIColor definitions (light/dark)
- \`Sources/Resources/Color+ThemeColors.swift\` — SwiftUI Color wrappers (\`Color.Theme.xxx\`)
EOF

    # Fastlane section (conditional)
    if [[ "$FASTLANE" == "yes" ]]; then
        cat <<EOF >> "${base_dir}/CLAUDE.md"

## Automation

This project includes scripts that wrap [Fastlane](https://fastlane.tools/) for build automation.

### Scripts
\`\`\`bash
./scripts/setup.sh               # Install dependencies and generate Xcode project
./scripts/certificates.sh        # Download signing certificates and provisioning profiles
./scripts/build.sh               # Build Production IPA (saved to ./build/)
./scripts/build.sh ${PROJECT_NAME}QA   # Build a specific target
./scripts/testflight.sh          # Build and upload Production to TestFlight
./scripts/testflight.sh ${PROJECT_NAME}QA   # Upload a specific target
\`\`\`

### First-Time Setup
1. \`./scripts/setup.sh\`
2. Edit \`fastlane/Appfile\` — set your Apple ID and Team ID
3. Edit \`fastlane/Matchfile\` — set your certificates git repo URL
4. \`./scripts/certificates.sh\`

### Fastlane (Advanced)
The scripts above are wrappers around these Fastlane lanes:
- \`bundle exec fastlane certificates\` — Download certs and profiles
- \`bundle exec fastlane build target:<TargetName>\` — Build IPA
- \`bundle exec fastlane beta target:<TargetName>\` — Build and upload to TestFlight

### Key Files
- \`scripts/\` — Wrapper scripts (setup, certificates, build, testflight)
- \`Gemfile\` — Ruby dependencies (Fastlane)
- \`fastlane/Appfile\` — App identifier and team configuration
- \`fastlane/Matchfile\` — Certificate management configuration
- \`fastlane/Fastfile\` — Lane definitions (build, upload, certificates)
EOF
    fi
}
