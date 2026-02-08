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
- \`Sources/Resources/\` — Material 3 color system, images, and asset catalogs
- \`Sources/Configuration/\` — xcconfig files and generated Info.plist
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
- \`Sources/Configuration/Debug.xcconfig\` — Debug build configuration
- \`Sources/Configuration/Release.xcconfig\` — Release build configuration
- \`Sources/Resources/ThemeColors.swift\` — Material 3 UIColor definitions (light/dark)
- \`Sources/Resources/Color+ThemeColors.swift\` — SwiftUI Color wrappers (\`Color.Theme.xxx\`)
EOF
}
