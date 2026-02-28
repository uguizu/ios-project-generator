# CLAUDE.md - ios-start-script Generator

## What This Project Is
A self-contained bash script (`generate.sh`) that interactively generates iOS/SwiftUI projects scaffolded with XcodeGen.

## Project Structure
- `generate.sh` — Entry point. Sources all lib modules and runs `main()`.
- `lib/utils.sh` — Colors, formatting, print helpers
- `lib/validation.sh` — Input validation functions
- `lib/prompts.sh` — Interactive prompts and input collection
- `lib/scaffold.sh` — Directory structure creation
- `lib/git.sh` — Git init and post-generation summary
- `lib/m3_engine.js` — Bundled M3 color algorithm (JavaScriptCore, run via `osascript`)
- `lib/templates/` — Heredoc template generators:
  - `project_yml.sh`, `gitignore.sh`, `swift_sources.sh`, `colors.sh`, `tests.sh`, `claude_md.sh`, `readme.sh`, `fastlane.sh`

## How It Works
1. User runs `./generate.sh`
2. Script prompts for: project name, display name, primary color (6 presets + custom hex), org name, bundle ID prefix, deployment target, Swift version, output dir, QA target (Y/n), Dev target (Y/n), Fastlane (Y/n)
3. Validates all inputs (project name format, bundle ID format, deployment target >= 15.0)
4. Generates a complete project directory with: `project.yml`, `.gitignore`, SwiftUI source files, test files, `CLAUDE.md`, `README.md`, Fastlane automation with wrapper scripts (optional)
5. Optionally initializes a git repo with initial commit

## Modifying Templates
Each template lives in its own file under `lib/templates/`:
- `lib/templates/project_yml.sh` — `generate_project_yml()` — XcodeGen project spec
- `lib/templates/gitignore.sh` — `generate_gitignore()` — git ignore rules
- `lib/templates/swift_sources.sh` — `generate_app_swift()`, `generate_content_view()`, `generate_assets()`, `generate_configuration()`
- `lib/templates/tests.sh` — `generate_unit_tests()`, `generate_ui_tests()`
- `lib/templates/claude_md.sh` — `generate_claude_md()` — project intelligence file
- `lib/templates/readme.sh` — `generate_readme()` — project README with setup and script docs
- `lib/templates/fastlane.sh` — `generate_fastlane()` — Fastlane automation (Gemfile, Appfile, Matchfile, Fastfile) and wrapper scripts

## Multi-Target Architecture
Generated projects support three app targets (QA and Dev are optional, default: yes):
- **Production** (`${PROJECT_NAME}`) — original display name, production API URL
- **QA** (`${PROJECT_NAME}QA`) — appends " QA" to display name, `.qa` bundle ID suffix
- **Development** (`${PROJECT_NAME}Dev`) — appends " Dev" to display name, `.dev` bundle ID suffix

Config files are tied to **targets** (not build configurations):
- `Sources/Configuration/Production.xcconfig` — always generated
- `Sources/Configuration/QA.xcconfig` — generated when `QA_TARGET=yes`
- `Sources/Configuration/Development.xcconfig` — generated when `DEV_TARGET=yes`

Each xcconfig sets `API_BASE_URL` and `APP_DISPLAY_NAME`. Both Debug and Release builds of the same target use the same xcconfig. Debug/Release only control compiler optimization.

CLI args: `--qa-target <yes/no>`, `--dev-target <yes/no>`. Global vars: `QA_TARGET`, `DEV_TARGET`. Normalization helper: `normalize_yes_no()` in `lib/prompts.sh`.

## Fastlane Automation
Generated projects optionally include Fastlane automation (default: yes):
- `Gemfile` — Ruby dependencies (Fastlane)
- `fastlane/Appfile` — App identifier and team configuration
- `fastlane/Matchfile` — Certificate management (git-synced), includes all enabled target bundle IDs
- `fastlane/Fastfile` — Lanes: `certificates`, `build`, `beta`, plus per-target convenience lanes
- `scripts/setup.sh`, `certificates.sh`, `build.sh`, `testflight.sh` — Developer-friendly wrapper scripts

CLI arg: `--fastlane <yes/no>`. Global var: `FASTLANE`. Follows the same optional-feature pattern as QA/Dev targets.

## Compatibility
- Targets macOS bash 3.2 (ships with macOS) — no bash 4+ features used
- Custom hex colors use `osascript -l JavaScript` (JavaScriptCore, ships with macOS) to run the bundled M3 engine
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
