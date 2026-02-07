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

    mkdir -p "${base_dir}/Sources/${PROJECT_NAME}"
    mkdir -p "${base_dir}/Sources/${PROJECT_NAME}/Assets.xcassets/AccentColor.colorset"
    mkdir -p "${base_dir}/Sources/${PROJECT_NAME}/Assets.xcassets/AppIcon.appiconset"
    mkdir -p "${base_dir}/Sources/${PROJECT_NAME}/Preview Content/Preview Assets.xcassets"
    mkdir -p "${base_dir}/Tests/${PROJECT_NAME}Tests"
    mkdir -p "${base_dir}/UITests/${PROJECT_NAME}UITests"
}
