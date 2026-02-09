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

# ─── Argument Parsing ─────────────────────────────────────────────────────────

USE_DEFAULTS="false"
PROJECT_NAME=""
DISPLAY_NAME=""
PRIMARY_COLOR=""
PRIMARY_COLOR_HEX=""
ORG_NAME=""
BUNDLE_ID_PREFIX=""
DEPLOYMENT_TARGET=""
SWIFT_VERSION=""
OUTPUT_DIR=""
GIT_INIT=""
GIT_COMMIT=""

parse_arguments() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --help|-h)
                print_help
                exit 0
                ;;
            --defaults)
                USE_DEFAULTS="true"
                shift
                ;;
            --name)
                PROJECT_NAME="$2"
                shift 2
                ;;
            --display-name)
                DISPLAY_NAME="$2"
                shift 2
                ;;
            --color)
                PRIMARY_COLOR="$2"
                shift 2
                ;;
            --org)
                ORG_NAME="$2"
                shift 2
                ;;
            --bundle-id)
                BUNDLE_ID_PREFIX="$2"
                shift 2
                ;;
            --deployment-target)
                DEPLOYMENT_TARGET="$2"
                shift 2
                ;;
            --swift-version)
                SWIFT_VERSION="$2"
                shift 2
                ;;
            --output-dir)
                OUTPUT_DIR="$2"
                shift 2
                ;;
            --git-init)
                GIT_INIT="$2"
                shift 2
                ;;
            --git-commit)
                GIT_COMMIT="$2"
                shift 2
                ;;
            *)
                echo -e "${RED}Error: Unknown option $1${NC}"
                echo "Run './generate.sh --help' for usage information."
                exit 1
                ;;
        esac
    done
}

# ─── Main ─────────────────────────────────────────────────────────────────────

main() {
    local total_steps=11

    parse_arguments "$@"

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

    print_step 7 $total_steps "Generating services and utilities..."
    generate_services "$base_dir"
    generate_network_mocks "$base_dir"
    generate_utils "$base_dir"
    print_success "Services, models, and utilities generated."

    print_step 8 $total_steps "Generating theme color system..."
    generate_theme_colors "$base_dir"
    generate_color_extensions "$base_dir"
    print_success "ThemeColors.swift and Color+ThemeColors.swift generated."

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

main "$@"
