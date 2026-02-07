#!/bin/bash
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

    # App sources
    mkdir -p "${base_dir}/Sources"
    mkdir -p "${base_dir}/Sources/Modules/Root"
    mkdir -p "${base_dir}/Sources/Network"
    mkdir -p "${base_dir}/Sources/Services/Models"
    mkdir -p "${base_dir}/Sources/Services/Implements"
    mkdir -p "${base_dir}/Sources/Resources/Images/Assets.xcassets/AccentColor.colorset"
    mkdir -p "${base_dir}/Sources/Resources/Images/Assets.xcassets/AppIcon.appiconset"
    mkdir -p "${base_dir}/Sources/Configuration"

    # Tests
    mkdir -p "${base_dir}/Tests/${PROJECT_NAME}Tests"
    mkdir -p "${base_dir}/UITests/${PROJECT_NAME}UITests"
}
