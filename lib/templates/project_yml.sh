#!/bin/bash
# ─── project.yml ──────────────────────────────────────────────────────────────

generate_project_yml() {
    local base_dir="$1"

    cat <<EOF > "${base_dir}/project.yml"
name: ${PROJECT_NAME}

configs:
  Debug: debug
  Release: release

configFiles:
  Debug: Sources/Configuration/Debug.xcconfig
  Release: Sources/Configuration/Release.xcconfig

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
      - path: Sources
        excludes:
          - "Configuration/*.xcconfig"
    configFiles:
      Debug: Sources/Configuration/Debug.xcconfig
      Release: Sources/Configuration/Release.xcconfig
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
      path: Sources/Configuration/Info.plist
      properties:
        CFBundleDisplayName: ${DISPLAY_NAME}
        CFBundleShortVersionString: "\$(MARKETING_VERSION)"
        CFBundleVersion: "\$(CURRENT_PROJECT_VERSION)"
        APIBaseURL: "\$(API_BASE_URL)"
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
