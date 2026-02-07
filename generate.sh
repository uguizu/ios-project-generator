#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ─── Source Libraries ─────────────────────────────────────────────────────────

source "${SCRIPT_DIR}/lib/utils.sh"
source "${SCRIPT_DIR}/lib/validation.sh"
source "${SCRIPT_DIR}/lib/prompts.sh"
source "${SCRIPT_DIR}/lib/scaffold.sh"
source "${SCRIPT_DIR}/lib/templates/project_yml.sh"
source "${SCRIPT_DIR}/lib/templates/gitignore.sh"
source "${SCRIPT_DIR}/lib/templates/swift_sources.sh"
source "${SCRIPT_DIR}/lib/templates/colors.sh"
source "${SCRIPT_DIR}/lib/templates/tests.sh"
source "${SCRIPT_DIR}/lib/templates/claude_md.sh"
source "${SCRIPT_DIR}/lib/git.sh"

# ─── Main ─────────────────────────────────────────────────────────────────────

main() {
    local total_steps=11

    print_banner
    collect_inputs

    local base_dir="${OUTPUT_DIR}/${PROJECT_NAME}"

    echo ""
    print_step 1 $total_steps "Creating directory structure..."
    create_directory_structure "$base_dir"
    print_success "Directory structure created."

    print_step 2 $total_steps "Generating project.yml..."
    generate_project_yml "$base_dir"
    print_success "project.yml generated."

    print_step 3 $total_steps "Generating .gitignore..."
    generate_gitignore "$base_dir"
    print_success ".gitignore generated."

    print_step 4 $total_steps "Generating SwiftUI app entry point..."
    generate_app_swift "$base_dir"
    print_success "${PROJECT_NAME}App.swift generated."

    print_step 5 $total_steps "Generating ContentView and assets..."
    generate_content_view "$base_dir"
    generate_assets "$base_dir"
    print_success "ContentView.swift and asset catalogs generated."

    print_step 6 $total_steps "Generating network layer..."
    generate_network "$base_dir"
    print_success "NetworkClient.swift generated."

    print_step 7 $total_steps "Generating services layer..."
    generate_services "$base_dir"
    print_success "Services and models generated."

    print_step 8 $total_steps "Generating Material 3 color system..."
    generate_material_colors "$base_dir"
    generate_color_extensions "$base_dir"
    print_success "MaterialColors.swift and Color+MaterialColors.swift generated."

    print_step 9 $total_steps "Generating configuration files..."
    generate_configuration "$base_dir"
    print_success "xcconfig files generated."

    print_step 10 $total_steps "Generating test files..."
    generate_unit_tests "$base_dir"
    generate_ui_tests "$base_dir"
    print_success "Unit test and UI test files generated."

    print_step 11 $total_steps "Generating CLAUDE.md..."
    generate_claude_md "$base_dir"
    print_success "CLAUDE.md generated."

    echo ""
    init_git_repo "$base_dir"

    print_summary "$base_dir"
}

main
