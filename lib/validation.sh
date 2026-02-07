#!/bin/bash
# ─── Validation ────────────────────────────────────────────────────────────────

validate_project_name() {
    local name="$1"
    if [[ ! "$name" =~ ^[A-Za-z][A-Za-z0-9_]*$ ]]; then
        print_error "Project name must start with a letter and contain only letters, numbers, and underscores."
        return 1
    fi
    local reserved
    for reserved in Test Tests Build DerivedData Pods Packages; do
        if [[ "$name" == "$reserved" ]]; then
            print_error "Project name '$name' is reserved. Please choose another name."
            return 1
        fi
    done
    return 0
}

validate_bundle_id_prefix() {
    local bid="$1"
    if [[ ! "$bid" =~ ^[a-zA-Z][a-zA-Z0-9-]*(\.[a-zA-Z][a-zA-Z0-9-]*)+$ ]]; then
        print_error "Bundle ID prefix must be in reverse domain notation (e.g., com.example)."
        return 1
    fi
    return 0
}

validate_deployment_target() {
    local target="$1"
    if [[ ! "$target" =~ ^[0-9]+\.[0-9]+$ ]]; then
        print_error "Deployment target must be in format X.Y (e.g., 17.0)."
        return 1
    fi
    local major="${target%%.*}"
    if [ "$major" -lt 15 ]; then
        print_error "Deployment target must be iOS 15.0 or higher for SwiftUI app lifecycle."
        return 1
    fi
    return 0
}

validate_swift_version() {
    local version="$1"
    if [[ "$version" != "5" && "$version" != "6" ]]; then
        print_error "Swift version must be 5 or 6."
        return 1
    fi
    return 0
}

validate_hex_color() {
    local hex="$1"
    if [[ ! "$hex" =~ ^#?[0-9A-Fa-f]{6}$ ]]; then
        print_error "Hex color must be in format #RRGGBB or RRGGBB (e.g., #6750A4)."
        return 1
    fi
    return 0
}
