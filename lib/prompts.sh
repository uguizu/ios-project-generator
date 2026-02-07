#!/bin/bash
# ─── Prompt Helper ─────────────────────────────────────────────────────────────

prompt_with_default() {
    local prompt_message="$1"
    local default_value="$2"
    local input
    read -r -p "  ${prompt_message} [${default_value}]: " input
    echo "${input:-$default_value}"
}

# ─── Input Collection ──────────────────────────────────────────────────────────

collect_inputs() {
    echo -e "${BOLD}Project Configuration${NC}"
    echo "Answer the following questions (press Enter to accept defaults)."
    echo ""

    # Project Name
    while true; do
        PROJECT_NAME=$(prompt_with_default "Project name" "MyApp")
        if validate_project_name "$PROJECT_NAME"; then
            break
        fi
    done

    # Display Name
    DISPLAY_NAME=$(prompt_with_default "Display name (shown on device)" "$PROJECT_NAME")

    # Primary Color Theme
    echo ""
    echo "  Primary color theme:"
    echo "    1) Blue (default)"
    echo "    2) Purple"
    echo "    3) Green"
    echo "    4) Red"
    echo "    5) Orange"
    echo "    6) Teal"
    local color_choice
    read -r -p "  Select [1-6]: " color_choice
    case "${color_choice:-1}" in
        1) PRIMARY_COLOR="blue" ;;
        2) PRIMARY_COLOR="purple" ;;
        3) PRIMARY_COLOR="green" ;;
        4) PRIMARY_COLOR="red" ;;
        5) PRIMARY_COLOR="orange" ;;
        6) PRIMARY_COLOR="teal" ;;
        *) PRIMARY_COLOR="blue" ;;
    esac
    echo ""

    # Organization Name
    while true; do
        ORG_NAME=$(prompt_with_default "Organization name" "MyOrganization")
        if [[ -n "$ORG_NAME" ]]; then
            break
        fi
        print_error "Organization name cannot be empty."
    done

    # Bundle ID Prefix
    local default_bundle_id
    default_bundle_id="com.$(echo "$ORG_NAME" | tr '[:upper:]' '[:lower:]' | tr -d ' ' | tr -cd 'a-z0-9')"
    while true; do
        BUNDLE_ID_PREFIX=$(prompt_with_default "Bundle ID prefix" "$default_bundle_id")
        if validate_bundle_id_prefix "$BUNDLE_ID_PREFIX"; then
            break
        fi
    done

    # Deployment Target
    while true; do
        DEPLOYMENT_TARGET=$(prompt_with_default "iOS deployment target" "17.0")
        if validate_deployment_target "$DEPLOYMENT_TARGET"; then
            break
        fi
    done

    # Swift Version
    while true; do
        SWIFT_VERSION=$(prompt_with_default "Swift language version (5 or 6)" "6")
        if validate_swift_version "$SWIFT_VERSION"; then
            break
        fi
    done

    # Output Directory
    OUTPUT_DIR=$(prompt_with_default "Output directory" ".")

    # Derived values
    PROJECT_NAME_LOWER=$(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]')
    FULL_BUNDLE_ID="${BUNDLE_ID_PREFIX}.${PROJECT_NAME_LOWER}"

    # Confirmation
    echo ""
    echo -e "${BOLD}┌─────────────────────────────────────────────┐${NC}"
    echo -e "${BOLD}│ Project Configuration Summary               │${NC}"
    echo -e "${BOLD}├─────────────────────────────────────────────┤${NC}"
    printf "│ %-18s %-25s│\n" "Project Name:" "$PROJECT_NAME"
    printf "│ %-18s %-25s│\n" "Display Name:" "$DISPLAY_NAME"
    printf "│ %-18s %-25s│\n" "Primary Color:" "$PRIMARY_COLOR"
    printf "│ %-18s %-25s│\n" "Organization:" "$ORG_NAME"
    printf "│ %-18s %-25s│\n" "Bundle ID Prefix:" "$BUNDLE_ID_PREFIX"
    printf "│ %-18s %-25s│\n" "Deployment Target:" "iOS $DEPLOYMENT_TARGET"
    printf "│ %-18s %-25s│\n" "Swift Version:" "$SWIFT_VERSION"
    printf "│ %-18s %-25s│\n" "Output Directory:" "$OUTPUT_DIR/$PROJECT_NAME"
    printf "│ %-18s %-25s│\n" "Full Bundle ID:" "$FULL_BUNDLE_ID"
    echo -e "${BOLD}└─────────────────────────────────────────────┘${NC}"
    echo ""

    local proceed
    read -r -p "  Proceed with these settings? [Y/n]: " proceed
    if [[ "${proceed:-Y}" =~ ^[Nn]$ ]]; then
        echo "Aborted."
        exit 0
    fi
}
