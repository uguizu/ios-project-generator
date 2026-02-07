# CLAUDE.md - ios-start-script Generator

## What This Project Is
A self-contained bash script (`generate.sh`) that interactively generates iOS/SwiftUI projects scaffolded with XcodeGen.

## Project Structure
- `generate.sh` — The entire generator. All templates are embedded as heredocs. Single file, no external dependencies.

## How It Works
1. User runs `./generate.sh`
2. Script prompts for: project name, org name, bundle ID prefix, deployment target, Swift version, output dir
3. Validates all inputs (project name format, bundle ID format, deployment target >= 15.0)
4. Generates a complete project directory with: `project.yml`, `.gitignore`, SwiftUI source files, test files, `CLAUDE.md`
5. Optionally initializes a git repo with initial commit

## Modifying Templates
All generated file templates are in heredoc blocks inside their respective `generate_*` functions:
- `generate_project_yml()` — XcodeGen project spec
- `generate_gitignore()` — git ignore rules
- `generate_app_swift()` — @main SwiftUI entry point
- `generate_content_view()` — ContentView (conditional on deployment target for preview syntax)
- `generate_assets()` — Asset catalog JSON files
- `generate_unit_tests()` — Unit tests (conditional on Swift version: Swift Testing vs XCTest)
- `generate_ui_tests()` — UI tests (always XCTest/XCUITest)
- `generate_claude_md()` — Project intelligence file

## Compatibility
- Targets macOS bash 3.2 (ships with macOS) — no bash 4+ features used
- No external dependencies required to run the generator itself
- Generated projects require `xcodegen` (`brew install xcodegen`) to produce `.xcodeproj`

## Git Conventions
- Use [Conventional Commits](https://www.conventionalcommits.org/) for all commit messages
- Format: `<type>(<scope>): <description>`
- Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, `build`, `ci`
- Examples: `feat(generator): add SwiftUI template`, `fix(validation): handle empty bundle ID`

## Testing Changes
```bash
./generate.sh          # Run interactively, accept defaults or customize
cd MyApp               # Enter generated project
xcodegen generate      # Generate Xcode project from project.yml
open MyApp.xcodeproj   # Open in Xcode and verify it builds
```
