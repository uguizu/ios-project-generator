#!/bin/bash
# ─── Prompt Helper ─────────────────────────────────────────────────────────────

prompt_with_default() {
    local prompt_message="$1"
    local default_value="$2"
    local input
    # Output prompt to stderr so it doesn't get captured by command substitution
    echo -ne "  ${CYAN}◆${NC} ${prompt_message} ${DIM}[${default_value}]${NC}: " >&2
    read -r input
    echo "${input:-$default_value}"
}

prompt_fancy() {
    local prompt_message="$1"
    local default_value="$2"
    local icon="${3:-◆}"
    local input
    # Output prompt to stderr so it doesn't get captured by command substitution
    echo -ne "  ${BLUE}${icon}${NC} ${BOLD}${prompt_message}${NC}" >&2
    if [[ -n "$default_value" ]]; then
        echo -ne " ${DIM}(default: ${default_value})${NC}" >&2
    fi
    echo -ne "\n    ${CYAN}→${NC} " >&2
    read -r input
    echo "${input:-$default_value}"
}

# ─── Input Collection ──────────────────────────────────────────────────────────

collect_inputs() {
    # Skip prompts if using defaults
    if [[ "$USE_DEFAULTS" == "true" ]]; then
        apply_default_values
        show_configuration_summary
        return
    fi

    print_section "📋 Project Configuration"

    # First, show all values that were provided via args
    local has_args=false
    if [[ -n "$PROJECT_NAME" || -n "$DISPLAY_NAME" || -n "$PRIMARY_COLOR" || -n "$ORG_NAME" || -n "$BUNDLE_ID_PREFIX" || -n "$DEPLOYMENT_TARGET" || -n "$SWIFT_VERSION" || -n "$OUTPUT_DIR" || -n "$QA_TARGET" || -n "$DEV_TARGET" ]]; then
        has_args=true
        echo -e "${DIM}Values provided via command-line arguments:${NC}"
        echo ""
        [[ -n "$PROJECT_NAME" ]] && echo -e "  ${BLUE}📦${NC} Project name: ${GREEN}$PROJECT_NAME${NC}"
        [[ -n "$DISPLAY_NAME" ]] && echo -e "  ${BLUE}📱${NC} Display name: ${GREEN}$DISPLAY_NAME${NC}"
        if [[ -n "$PRIMARY_COLOR" ]]; then
            if [[ "$PRIMARY_COLOR" == "custom" ]]; then
                echo -e "  ${BLUE}🎨${NC} Primary color: ${GREEN}custom (#$PRIMARY_COLOR_HEX)${NC}"
            else
                echo -e "  ${BLUE}🎨${NC} Primary color: ${GREEN}$PRIMARY_COLOR${NC}"
            fi
        fi
        [[ -n "$ORG_NAME" ]] && echo -e "  ${BLUE}🏢${NC} Organization: ${GREEN}$ORG_NAME${NC}"
        [[ -n "$BUNDLE_ID_PREFIX" ]] && echo -e "  ${BLUE}📦${NC} Bundle ID prefix: ${GREEN}$BUNDLE_ID_PREFIX${NC}"
        [[ -n "$DEPLOYMENT_TARGET" ]] && echo -e "  ${BLUE}🎯${NC} Deployment target: ${GREEN}$DEPLOYMENT_TARGET${NC}"
        [[ -n "$SWIFT_VERSION" ]] && echo -e "  ${BLUE}⚡${NC} Swift version: ${GREEN}$SWIFT_VERSION${NC}"
        [[ -n "$OUTPUT_DIR" ]] && echo -e "  ${BLUE}📁${NC} Output directory: ${GREEN}$OUTPUT_DIR${NC}"
        [[ -n "$QA_TARGET" ]] && echo -e "  ${BLUE}🎯${NC} QA target: ${GREEN}$QA_TARGET${NC}"
        [[ -n "$DEV_TARGET" ]] && echo -e "  ${BLUE}🎯${NC} Dev target: ${GREEN}$DEV_TARGET${NC}"
        echo ""
    fi

    # Now prompt for missing values
    if $has_args; then
        echo -e "${DIM}Please provide remaining values (press Enter for defaults):${NC}"
        echo ""
    else
        echo -e "${DIM}Press Enter to accept defaults shown in brackets${NC}"
        echo ""
    fi

    # Project Name
    if [[ -z "$PROJECT_NAME" ]]; then
        while true; do
            PROJECT_NAME=$(prompt_fancy "Project name" "MyApp" "📦")
            if validate_project_name "$PROJECT_NAME"; then
                break
            fi
        done
    fi

    # Display Name
    if [[ -z "$DISPLAY_NAME" ]]; then
        DISPLAY_NAME=$(prompt_fancy "Display name" "$PROJECT_NAME" "📱")
    fi

    # Primary Color Theme
    if [[ -z "$PRIMARY_COLOR" ]]; then
        echo ""
        echo -e "  ${BLUE}🎨${NC} ${BOLD}Primary color theme${NC}"
        echo ""
        echo -e "    ${DIM}1)${NC} Blue       ${DIM}(Professional, default)${NC}"
        echo -e "    ${DIM}2)${NC} Purple     ${DIM}(Creative)${NC}"
        echo -e "    ${DIM}3)${NC} Green      ${DIM}(Nature, health)${NC}"
        echo -e "    ${DIM}4)${NC} Red        ${DIM}(Urgent, bold)${NC}"
        echo -e "    ${DIM}5)${NC} Orange     ${DIM}(Energetic)${NC}"
        echo -e "    ${DIM}6)${NC} Teal       ${DIM}(Modern, tech)${NC}"
        echo -e "    ${DIM}7)${NC} Custom     ${DIM}(Enter hex color)${NC}"
        echo ""
        local color_choice
        echo -ne "    ${CYAN}→${NC} Select ${DIM}[1-7]${NC}: "
        read -r color_choice
        case "${color_choice:-1}" in
            1) PRIMARY_COLOR="blue" ;;
            2) PRIMARY_COLOR="purple" ;;
            3) PRIMARY_COLOR="green" ;;
            4) PRIMARY_COLOR="red" ;;
            5) PRIMARY_COLOR="orange" ;;
            6) PRIMARY_COLOR="teal" ;;
            7)
                while true; do
                    local hex_input
                    echo -ne "    ${CYAN}→${NC} Enter hex color ${DIM}(e.g., #6750A4)${NC}: "
                    read -r hex_input
                    if validate_hex_color "$hex_input"; then
                        PRIMARY_COLOR="custom"
                        hex_input="${hex_input#\#}"
                        PRIMARY_COLOR_HEX=$(echo "$hex_input" | tr '[:lower:]' '[:upper:]')
                        break
                    fi
                done
                ;;
            *) PRIMARY_COLOR="blue" ;;
        esac
        echo ""
    fi

    # Organization Name
    if [[ -z "$ORG_NAME" ]]; then
        while true; do
            ORG_NAME=$(prompt_fancy "Organization name" "MyOrganization" "🏢")
            if [[ -n "$ORG_NAME" ]]; then
                break
            fi
            print_error "Organization name cannot be empty."
        done
    fi

    # Bundle ID Prefix
    if [[ -z "$BUNDLE_ID_PREFIX" ]]; then
        local default_bundle_id
        default_bundle_id="com.$(echo "$ORG_NAME" | tr '[:upper:]' '[:lower:]' | tr -d ' ' | tr -cd 'a-z0-9')"
        while true; do
            BUNDLE_ID_PREFIX=$(prompt_fancy "Bundle ID prefix" "$default_bundle_id" "📦")
            if validate_bundle_id_prefix "$BUNDLE_ID_PREFIX"; then
                break
            fi
        done
    fi

    # Deployment Target
    if [[ -z "$DEPLOYMENT_TARGET" ]]; then
        while true; do
            DEPLOYMENT_TARGET=$(prompt_fancy "iOS deployment target" "17.0" "🎯")
            if validate_deployment_target "$DEPLOYMENT_TARGET"; then
                break
            fi
        done
    fi

    # Swift Version
    if [[ -z "$SWIFT_VERSION" ]]; then
        while true; do
            SWIFT_VERSION=$(prompt_fancy "Swift version" "6" "⚡")
            if validate_swift_version "$SWIFT_VERSION"; then
                break
            fi
        done
    fi

    # Output Directory
    if [[ -z "$OUTPUT_DIR" ]]; then
        OUTPUT_DIR=$(prompt_fancy "Output directory" "." "📁")
    fi

    # QA Target
    if [[ -z "$QA_TARGET" ]]; then
        local qa_choice
        echo -ne "  ${CYAN}◆${NC} Generate QA target? ${DIM}[Y/n]${NC}: "
        read -r qa_choice
        QA_TARGET="${qa_choice:-Y}"
    fi

    # Development Target
    if [[ -z "$DEV_TARGET" ]]; then
        local dev_choice
        echo -ne "  ${CYAN}◆${NC} Generate Development target? ${DIM}[Y/n]${NC}: "
        read -r dev_choice
        DEV_TARGET="${dev_choice:-Y}"
    fi

    # Derived values
    PROJECT_NAME_LOWER=$(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]')
    FULL_BUNDLE_ID="${BUNDLE_ID_PREFIX}.${PROJECT_NAME_LOWER}"

    # Normalize target flags
    if [[ "${QA_TARGET}" =~ ^[Yy]$ || "${QA_TARGET}" == "yes" ]]; then
        QA_TARGET="yes"
    else
        QA_TARGET="no"
    fi

    if [[ "${DEV_TARGET}" =~ ^[Yy]$ || "${DEV_TARGET}" == "yes" ]]; then
        DEV_TARGET="yes"
    else
        DEV_TARGET="no"
    fi

    # Show summary and confirm
    show_configuration_summary

    local proceed
    echo -ne "  ${CYAN}◆${NC} Proceed with these settings? ${DIM}[Y/n]${NC}: "
    read -r proceed
    if [[ "${proceed:-Y}" =~ ^[Nn]$ ]]; then
        echo -e "\n${YELLOW}⚠${NC} Aborted by user."
        exit 0
    fi
}

apply_default_values() {
    PROJECT_NAME="${PROJECT_NAME:-MyApp}"
    DISPLAY_NAME="${DISPLAY_NAME:-$PROJECT_NAME}"
    PRIMARY_COLOR="${PRIMARY_COLOR:-blue}"
    ORG_NAME="${ORG_NAME:-MyOrganization}"

    if [[ -z "$BUNDLE_ID_PREFIX" ]]; then
        BUNDLE_ID_PREFIX="com.$(echo "$ORG_NAME" | tr '[:upper:]' '[:lower:]' | tr -d ' ' | tr -cd 'a-z0-9')"
    fi

    DEPLOYMENT_TARGET="${DEPLOYMENT_TARGET:-17.0}"
    SWIFT_VERSION="${SWIFT_VERSION:-6}"
    OUTPUT_DIR="${OUTPUT_DIR:-.}"
    GIT_INIT="${GIT_INIT:-no}"
    GIT_COMMIT="${GIT_COMMIT:-no}"
    QA_TARGET="${QA_TARGET:-yes}"
    DEV_TARGET="${DEV_TARGET:-yes}"

    # Normalize target flags
    if [[ "${QA_TARGET}" =~ ^[Yy]$ || "${QA_TARGET}" == "yes" ]]; then
        QA_TARGET="yes"
    else
        QA_TARGET="no"
    fi

    if [[ "${DEV_TARGET}" =~ ^[Yy]$ || "${DEV_TARGET}" == "yes" ]]; then
        DEV_TARGET="yes"
    else
        DEV_TARGET="no"
    fi

    # Validate provided values
    if ! validate_project_name "$PROJECT_NAME"; then
        print_error "Invalid project name: $PROJECT_NAME"
        exit 1
    fi
    if ! validate_bundle_id_prefix "$BUNDLE_ID_PREFIX"; then
        print_error "Invalid bundle ID prefix: $BUNDLE_ID_PREFIX"
        exit 1
    fi
    if ! validate_deployment_target "$DEPLOYMENT_TARGET"; then
        print_error "Invalid deployment target: $DEPLOYMENT_TARGET"
        exit 1
    fi
    if ! validate_swift_version "$SWIFT_VERSION"; then
        print_error "Invalid Swift version: $SWIFT_VERSION"
        exit 1
    fi

    # Handle color
    if [[ "$PRIMARY_COLOR" =~ ^#?[0-9A-Fa-f]{6}$ ]]; then
        PRIMARY_COLOR_HEX="${PRIMARY_COLOR#\#}"
        PRIMARY_COLOR_HEX=$(echo "$PRIMARY_COLOR_HEX" | tr '[:lower:]' '[:upper:]')
        PRIMARY_COLOR="custom"
    fi

    # Derived values
    PROJECT_NAME_LOWER=$(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]')
    FULL_BUNDLE_ID="${BUNDLE_ID_PREFIX}.${PROJECT_NAME_LOWER}"
}

show_configuration_summary() {
    echo ""
    echo -e "${CYAN}╔═══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${NC}  ${BOLD}📋 Project Configuration Summary${NC}                       ${CYAN}║${NC}"
    echo -e "${CYAN}╠═══════════════════════════════════════════════════════════╣${NC}"
    printf "${CYAN}║${NC}  %-22s ${GREEN}%-30s${NC} ${CYAN}║${NC}\n" "Project Name:" "$PROJECT_NAME"
    printf "${CYAN}║${NC}  %-22s ${GREEN}%-30s${NC} ${CYAN}║${NC}\n" "Display Name:" "$DISPLAY_NAME"
    if [[ "$PRIMARY_COLOR" == "custom" ]]; then
        printf "${CYAN}║${NC}  %-22s ${GREEN}%-30s${NC} ${CYAN}║${NC}\n" "Primary Color:" "custom (#$PRIMARY_COLOR_HEX)"
    else
        printf "${CYAN}║${NC}  %-22s ${GREEN}%-30s${NC} ${CYAN}║${NC}\n" "Primary Color:" "$PRIMARY_COLOR"
    fi
    printf "${CYAN}║${NC}  %-22s ${GREEN}%-30s${NC} ${CYAN}║${NC}\n" "Organization:" "$ORG_NAME"
    printf "${CYAN}║${NC}  %-22s ${GREEN}%-30s${NC} ${CYAN}║${NC}\n" "Bundle ID Prefix:" "$BUNDLE_ID_PREFIX"
    printf "${CYAN}║${NC}  %-22s ${GREEN}%-30s${NC} ${CYAN}║${NC}\n" "Deployment Target:" "iOS $DEPLOYMENT_TARGET"
    printf "${CYAN}║${NC}  %-22s ${GREEN}%-30s${NC} ${CYAN}║${NC}\n" "Swift Version:" "$SWIFT_VERSION"
    printf "${CYAN}║${NC}  %-22s ${GREEN}%-30s${NC} ${CYAN}║${NC}\n" "Output Directory:" "$OUTPUT_DIR/$PROJECT_NAME"
    printf "${CYAN}║${NC}  %-22s ${GREEN}%-30s${NC} ${CYAN}║${NC}\n" "Full Bundle ID:" "$FULL_BUNDLE_ID"
    printf "${CYAN}║${NC}  %-22s ${GREEN}%-30s${NC} ${CYAN}║${NC}\n" "QA Target:" "$QA_TARGET"
    printf "${CYAN}║${NC}  %-22s ${GREEN}%-30s${NC} ${CYAN}║${NC}\n" "Dev Target:" "$DEV_TARGET"
    echo -e "${CYAN}╚═══════════════════════════════════════════════════════════╝${NC}"
    echo ""
}
