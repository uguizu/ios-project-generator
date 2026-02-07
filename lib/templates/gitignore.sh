#!/bin/bash
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
