#!/bin/bash
# ─── Colors & Formatting ──────────────────────────────────────────────────────

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m' # No Color

print_banner() {
    echo ""
    echo -e "${CYAN}╔══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║                                                          ║${NC}"
    echo -e "${CYAN}║${NC}  ${BOLD}${MAGENTA}📱  iOS Project Generator${NC} ${DIM}(XcodeGen + SwiftUI)${NC}  ${CYAN}║${NC}"
    echo -e "${CYAN}║                                                          ║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_success() {
    echo -e "${GREEN}✔ $1${NC}"
}

print_error() {
    echo -e "${RED}✘ $1${NC}"
}

print_info() {
    echo -e "${CYAN}ℹ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_step() {
    echo -e "${BOLD}${BLUE}[$1/$2]${NC} $3"
}

print_section() {
    echo ""
    echo -e "${CYAN}┌─────────────────────────────────────────────────────────┐${NC}"
    echo -e "${CYAN}│${NC} ${BOLD}$1${NC}"
    echo -e "${CYAN}└─────────────────────────────────────────────────────────┘${NC}"
    echo ""
}

print_help() {
    cat <<EOF
${BOLD}iOS Project Generator${NC} - Generate production-ready iOS/SwiftUI projects

${BOLD}USAGE:${NC}
    ./generate.sh [OPTIONS]

${BOLD}OPTIONS:${NC}
    ${BOLD}--defaults${NC}
        Use default values for all prompts (quick generation)

    ${BOLD}--name${NC} <name>
        Project name (alphanumeric, hyphens, underscores)

    ${BOLD}--display-name${NC} <name>
        Display name shown on device (defaults to project name)

    ${BOLD}--color${NC} <color>
        Primary color: blue, purple, green, red, orange, teal, or hex (#FF5733)

    ${BOLD}--org${NC} <organization>
        Organization name

    ${BOLD}--bundle-id${NC} <prefix>
        Bundle ID prefix (e.g., com.example)

    ${BOLD}--deployment-target${NC} <version>
        iOS deployment target (e.g., 17.0, minimum 15.0)

    ${BOLD}--swift-version${NC} <version>
        Swift language version: 5 or 6

    ${BOLD}--output-dir${NC} <path>
        Output directory (defaults to current directory)

    ${BOLD}--git-init${NC}
        Initialize git repository (yes/no)

    ${BOLD}--git-commit${NC}
        Create initial git commit (yes/no)

    ${BOLD}--qa-target${NC} <yes/no>
        Generate QA app target (default: yes)

    ${BOLD}--dev-target${NC} <yes/no>
        Generate Development app target (default: yes)

    ${BOLD}--help, -h${NC}
        Show this help message

${BOLD}EXAMPLES:${NC}
    ${DIM}# Interactive mode (default)${NC}
    ./generate.sh

    ${DIM}# Quick generation with defaults${NC}
    ./generate.sh --defaults

    ${DIM}# Custom project with parameters${NC}
    ./generate.sh --name MyApp --color purple --org MyCompany \\
                  --bundle-id com.mycompany --swift-version 6

    ${DIM}# Complete non-interactive generation${NC}
    ./generate.sh --defaults --name BrandApp --color "#FF5733" \\
                  --git-init yes --git-commit yes

    ${DIM}# Production-only (no QA/Dev targets)${NC}
    ./generate.sh --defaults --name MyApp --qa-target no --dev-target no

${BOLD}COLORS:${NC}
    blue     ${DIM}Professional, default${NC}
    purple   ${DIM}Creative${NC}
    green    ${DIM}Nature, health${NC}
    red      ${DIM}Urgent, bold${NC}
    orange   ${DIM}Energetic${NC}
    teal     ${DIM}Modern, tech${NC}
    #RRGGBB  ${DIM}Custom hex color${NC}

EOF
}
