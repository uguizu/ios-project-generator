# iOS Project Generator

> A self-contained bash script that generates production-ready iOS/SwiftUI projects with XcodeGen, Material Design 3 colors, and modern Swift architecture.

## Features

- 🎨 **Material Design 3 Color System** — 6 preset themes + custom hex color support with automatic light/dark mode
- 🏗️ **Modern Architecture** — Struct-based network layer, protocol-oriented design, value semantics
- ⚙️ **Configuration Management** — Target-specific settings via xcconfig files with type-safe access
- 🎯 **Multi-Target Support** — Production, QA, and Development targets with separate bundle IDs and display names
- 🧪 **Testing Ready** — Pre-configured unit and UI tests with Swift Testing (Swift 6) and XCTest (Swift 5)
- 📦 **Zero Dependencies** — Pure bash, runs on macOS with native tools (osascript for M3 colors)
- 🚀 **XcodeGen Integration** — Project configuration as code (`project.yml`)
- 🎯 **CLI Support** — Interactive mode, defaults mode, or full parameter injection for automation
- 💅 **Beautiful UI** — Color-coded prompts with icons and enhanced formatting

## Requirements

- macOS (tested on macOS 10.15+)
- Bash 3.2+ (ships with macOS)
- [XcodeGen](https://github.com/yonaskolb/XcodeGen) — Install via `brew install xcodegen`
- Xcode 15.0+ (for Swift 5) or Xcode 16.0+ (for Swift 6)

## Quick Start

```bash
# Clone the repository
git clone <repository-url>
cd ios-start-script

# Make the script executable (if needed)
chmod +x generate.sh

# Interactive mode - follow the prompts
./generate.sh

# Quick generation with defaults
./generate.sh --defaults

# Custom project with CLI parameters
./generate.sh --name MyApp --color purple --org MyCompany

# Follow generation with:
cd MyApp
xcodegen generate
open MyApp.xcodeproj
```

## Usage

The generator supports three modes:

### 1. Interactive Mode (Default)

Run without arguments for an interactive experience with beautiful prompts:

```bash
./generate.sh
```

The generator will prompt you for:

1. **Project Name** — Alphanumeric, hyphens, underscores (e.g., `MyApp`, `my-app`)
2. **Display Name** — User-facing app name (can include spaces)
3. **Primary Color** — Choose from 6 presets or enter custom hex color
   - Blue (default), Purple, Green, Red, Orange, Teal, or Custom
4. **Organization Name** — Your company/organization name
5. **Bundle ID Prefix** — Reverse domain notation (e.g., `com.example`)
6. **Deployment Target** — Minimum iOS version (≥15.0)
7. **Swift Version** — 5 or 6
8. **Output Directory** — Where to generate the project
9. **QA Target** — Generate QA app target (default: yes)
10. **Development Target** — Generate Development app target (default: yes)
11. **Git Initialization** — Optionally create initial commit

### 2. Defaults Mode (Quick Generation)

Skip all prompts and use default values:

```bash
./generate.sh --defaults
```

**Default values:**
- Project Name: `MyApp`
- Display Name: `MyApp`
- Primary Color: `blue`
- Organization: `MyOrganization`
- Bundle ID Prefix: `com.myorganization`
- Deployment Target: `17.0`
- Swift Version: `6`
- Output Directory: `.`
- QA Target: `yes`
- Dev Target: `yes`
- Git Init: `no`

### 3. Parameter Injection (Automation)

Provide specific values via CLI arguments:

```bash
# Custom project with parameters
./generate.sh --name BrandApp --color "#FF5733" --org "Cool Company" \
              --bundle-id com.coolcompany --swift-version 6

# Complete non-interactive generation
./generate.sh --defaults --name MyApp --color purple \
              --git-init yes --git-commit yes
```

**Available CLI Options:**

| Flag | Description | Example |
|------|-------------|---------|
| `--defaults` | Use default values for all prompts | `--defaults` |
| `--name <name>` | Project name | `--name MyApp` |
| `--display-name <name>` | Display name | `--display-name "My App"` |
| `--color <color>` | Primary color (preset or hex) | `--color purple` or `--color "#FF5733"` |
| `--org <organization>` | Organization name | `--org "MyCompany"` |
| `--bundle-id <prefix>` | Bundle ID prefix | `--bundle-id com.example` |
| `--deployment-target <version>` | iOS deployment target | `--deployment-target 16.0` |
| `--swift-version <version>` | Swift version (5 or 6) | `--swift-version 6` |
| `--output-dir <path>` | Output directory | `--output-dir ./projects` |
| `--git-init <yes/no>` | Initialize git repository | `--git-init yes` |
| `--git-commit <yes/no>` | Create initial commit | `--git-commit yes` |
| `--qa-target <yes/no>` | Generate QA app target (default: yes) | `--qa-target no` |
| `--dev-target <yes/no>` | Generate Development app target (default: yes) | `--dev-target no` |
| `--help, -h` | Show help message | `--help` |

### Interactive UI Preview

The generator features a beautiful color-coded interface:

```
╔══════════════════════════════════════════════════════════╗
║                                                          ║
║  📱  iOS Project Generator (XcodeGen + SwiftUI)          ║
║                                                          ║
╚══════════════════════════════════════════════════════════╝

┌─────────────────────────────────────────────────────────┐
│ 📋 Project Configuration
└─────────────────────────────────────────────────────────┘

  📦 Project name (default: MyApp)
    → _

  🎨 Primary color theme
    1) Blue       (Professional, default)
    2) Purple     (Creative)
    ...
```

## Generated Project Structure

```
MyApp/
├── project.yml                          # XcodeGen configuration (source of truth)
├── .gitignore
├── CLAUDE.md                            # AI assistant instructions
├── Sources/
│   ├── MyAppApp.swift                   # App entry point
│   ├── Modules/
│   │   └── Root/
│   │       └── ContentView.swift        # Main view
│   ├── Core/
│   │   ├── Network/
│   │   │   └── NetworkClient.swift      # Struct-based HTTP client
│   │   ├── Services/
│   │   │   └── Sample/
│   │   │       ├── SampleAPI.swift      # API endpoint definitions
│   │   │       ├── SampleServiceProtocol.swift
│   │   │       └── SampleService.swift  # Service implementation
│   │   ├── Models/
│   │   │   └── SampleModel.swift        # Data models
│   │   └── Utils/
│   │       └── Configuration.swift      # Type-safe config access
│   ├── Resources/
│   │   ├── ThemeColors.swift            # M3 UIColor definitions
│   │   ├── Color+ThemeColors.swift      # SwiftUI Color extensions
│   │   └── Images/
│   │       └── Assets.xcassets
│   └── Configuration/
│       ├── Production.xcconfig           # Production target config
│       ├── QA.xcconfig                   # QA target config (optional)
│       ├── Development.xcconfig          # Development target config (optional)
│       └── Info.plist                    # Generated by XcodeGen
├── Tests/
│   └── MyAppTests/
│       └── SampleServiceTests.swift
└── UITests/
    └── MyAppUITests/
        └── MyAppUITests.swift
```

## Key Features

### Material Design 3 Color System

The generator includes a bundled M3 color algorithm (`lib/m3_engine.js`) that generates 33 semantic color tokens from a single primary color:

```swift
// UIKit
let primaryColor = ThemeColors.primary
let surfaceColor = ThemeColors.surface

// SwiftUI
Color.Theme.primary
Color.Theme.onPrimaryContainer
```

**Presets:**
- Blue (#0061A4) — Default, professional
- Purple (#6750A4) — Creative
- Green (#006E1C) — Nature, health
- Red (#BA1A1A) — Urgent, bold
- Orange (#8B5000) — Energetic
- Teal (#006A6A) — Modern, tech

**Custom Hex:** Enter any hex color (e.g., `#FF5733`) for brand-specific palettes.

### Network Layer

Struct-based, protocol-oriented architecture with async/await:

```swift
// Define endpoints
enum UserAPI {
    case fetchUser(id: String)
    case updateUser(id: String, name: String)
}

extension UserAPI: Endpoint {
    var baseURL: URL { URL(string: Configuration.baseURL)! }
    var path: String { /* ... */ }
    var method: HTTPMethod { /* ... */ }
}

// Use in services
struct UserService: UserServiceProtocol {
    let networkClient: NetworkClientProtocol

    func fetchUser(id: String) async throws -> User {
        try await networkClient.request(UserAPI.fetchUser(id: id))
    }
}
```

### Multi-Target Configuration

Generated projects support up to three app targets, each with its own xcconfig file:

| Target | xcconfig | Bundle ID Suffix | Display Name |
|--------|----------|-----------------|--------------|
| Production | `Production.xcconfig` | *(none)* | `MyApp` |
| QA | `QA.xcconfig` | `.qa` | `MyApp QA` |
| Development | `Development.xcconfig` | `.dev` | `MyApp Dev` |

Each xcconfig sets environment-specific values:

**Production.xcconfig:**
```
API_BASE_URL = https://api.example.com
APP_DISPLAY_NAME = MyApp
```

**QA.xcconfig:**
```
API_BASE_URL = https://qa.api.example.com
APP_DISPLAY_NAME = MyApp QA
```

Config files are tied to **targets** (not build configurations). Both Debug and Release builds of the same target use the same xcconfig. Debug/Release only control compiler optimization and debug symbols.

**Access in code:**
```swift
let baseURL = Configuration.baseURL  // Type-safe, crashes early if missing
```

Values are injected into Info.plist during build and accessed via `Bundle.main`. All three apps can coexist on the same device thanks to separate bundle IDs.

**Production-only mode:**
```bash
./generate.sh --defaults --qa-target no --dev-target no
```

### Testing

Generated projects include test targets with mock implementations:

**Swift Testing (Swift 6):**
```swift
@Test func testFetchSamplesSuccess() async throws {
    mockNetworkClient.mockResponse = [/* test data */]
    let result = try await sut.fetchSamples()
    #expect(result.count == 1)
}
```

**XCTest (Swift 5):**
```swift
func testFetchSamplesSuccess() async throws {
    mockNetworkClient.mockResponse = [/* test data */]
    let result = try await sut.fetchSamples()
    XCTAssertEqual(result.count, 1)
}
```

## Development

### Project Structure

```
ios-start-script/
├── generate.sh                    # Entry point
├── lib/
│   ├── utils.sh                   # Colors, formatting, print helpers
│   ├── validation.sh              # Input validation
│   ├── prompts.sh                 # Interactive prompts
│   ├── scaffold.sh                # Directory creation
│   ├── git.sh                     # Git initialization
│   ├── m3_engine.js               # M3 color algorithm (bundled)
│   └── templates/                 # Template generators
│       ├── project_yml.sh
│       ├── gitignore.sh
│       ├── swift_sources.sh       # Network, services, app files
│       ├── colors.sh              # M3 color generation
│       ├── tests.sh
│       └── claude_md.sh
└── CLAUDE.md                      # Project instructions
```

### Adding New Features

1. **New Template:** Create function in `lib/templates/` and call from `generate.sh`
2. **New Validation:** Add to `lib/validation.sh`
3. **New Prompt:** Add to `lib/prompts.sh`
4. **Test Changes:**
   ```bash
   ./generate.sh
   cd TestProject
   xcodegen generate
   xcodebuild -scheme TestProject -sdk iphonesimulator build
   ```

### Git Conventions

Use [Conventional Commits](https://www.conventionalcommits.org/):

```
feat(generator): add dark mode support
fix(validation): handle empty project name
docs(readme): update installation instructions
refactor(network): convert to struct-based design
```

## Troubleshooting

### XcodeGen Not Found
```bash
brew install xcodegen
```

### M3 Color Engine Issues
The bundled `lib/m3_engine.js` uses JavaScriptCore via `osascript`. If you encounter issues:
- Ensure you're on macOS (required for osascript)
- Check that `lib/m3_engine.js` exists and is readable
- Use preset colors instead of custom hex as a workaround

### Build Errors
```bash
# Clean and regenerate
cd MyApp
rm -rf MyApp.xcodeproj
xcodegen generate
open MyApp.xcodeproj
```

### Code Signing Issues
For simulator builds:
```bash
xcodebuild -scheme MyApp -sdk iphonesimulator build \
  CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO
```

## Examples

### Quick Default Project
```bash
# Generate with all defaults - no prompts
./generate.sh --defaults
```

### Custom Project Name and Color
```bash
# Mix defaults with custom values
./generate.sh --defaults --name BrandApp --color purple
```

### Complete Custom Configuration
```bash
# Specify all parameters - fully non-interactive
./generate.sh --name AwesomeApp \
              --display-name "Awesome App" \
              --color "#FF5733" \
              --org "Cool Company" \
              --bundle-id com.coolcompany \
              --deployment-target 16.0 \
              --swift-version 6 \
              --output-dir ./projects \
              --git-init yes \
              --git-commit yes
```

### CI/CD Integration
```bash
# Perfect for automated project generation
./generate.sh --defaults \
              --name "Project-${CI_BUILD_NUMBER}" \
              --color blue \
              --org "${COMPANY_NAME}" \
              --bundle-id "${BUNDLE_PREFIX}" \
              --git-init yes
```

### Interactive with Pre-filled Values
```bash
# Provide some values, get prompted for the rest
./generate.sh --name MyApp --org MyCompany
# Will prompt for: display name, color, bundle ID, deployment target, swift version, output dir
```

## Compatibility

- **macOS:** Bash 3.2+ (no bash 4+ features used)
- **Swift:** 5.x or 6.x (user-selectable)
- **iOS:** 15.0+ deployment targets
- **Xcode:** 15.0+ (Swift 5) or 16.0+ (Swift 6)

## Architecture Decisions

### Why Structs for Network/Services?
- **Value semantics:** Immutable configuration reduces bugs
- **Performance:** Stack allocation, no ARC overhead
- **Testability:** Easy dependency injection via initializers
- **Swift-native:** Aligns with Swift's protocol-oriented design

### Why XcodeGen?
- **Version control friendly:** YAML diffs vs opaque `.xcodeproj`
- **Reproducible:** Same `project.yml` always generates identical project
- **Maintainable:** Easier to modify targets, schemes, settings
- **Collaboration:** Fewer merge conflicts

### Why Bash?
- **Portability:** Ships with every Mac
- **Zero dependencies:** No Node, Python, Ruby required
- **Simple:** Text manipulation, file generation
- **Reliable:** Mature, stable, well-documented

## License

This project is licensed under the [GNU General Public License v3.0](LICENSE). You are free to use, modify, and distribute this software under the terms of the GPL-3.0.

## Contributing

Contributions are welcome! Please follow:
1. Fork the repository
2. Create a feature branch (`git checkout -b feat/amazing-feature`)
3. Commit with conventional commits (`feat:`, `fix:`, etc.)
4. Push and open a pull request

## Credits

- Material Design 3 color algorithm: [@material/material-color-utilities](https://github.com/material-foundation/material-color-utilities)
- XcodeGen: [yonaskolb/XcodeGen](https://github.com/yonaskolb/XcodeGen)

---

**Made with ❤️ for Swift developers who value clean architecture and automation.**
