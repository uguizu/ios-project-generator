#!/bin/bash
# ─── Theme Colors (Material Design 3) ────────────────────────────────────────
# Generated palette values from @material/material-color-utilities

# Sets palette variables for the given theme name.
# Each variable follows the pattern: C_<TOKEN>_<L|D> and C_<TOKEN>_<L|D>_HEX
# where L = light mode, D = dark mode.
_set_theme_palette() {
    local theme="$1"
    case "$theme" in
        blue)
            C_PRIMARY_L="red: 0.000, green: 0.380, blue: 0.643, alpha: 1"
            C_PRIMARY_L_HEX="#0061A4"
            C_PRIMARY_D="red: 0.624, green: 0.792, blue: 1.000, alpha: 1"
            C_PRIMARY_D_HEX="#9FCAFF"
            C_ON_PRIMARY_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_PRIMARY_L_HEX="#FFFFFF"
            C_ON_PRIMARY_D="red: 0.000, green: 0.196, blue: 0.345, alpha: 1"
            C_ON_PRIMARY_D_HEX="#003258"
            C_PRIMARY_CONTAINER_L="red: 0.820, green: 0.894, blue: 1.000, alpha: 1"
            C_PRIMARY_CONTAINER_L_HEX="#D1E4FF"
            C_PRIMARY_CONTAINER_D="red: 0.000, green: 0.286, blue: 0.490, alpha: 1"
            C_PRIMARY_CONTAINER_D_HEX="#00497D"
            C_ON_PRIMARY_CONTAINER_L="red: 0.000, green: 0.114, blue: 0.212, alpha: 1"
            C_ON_PRIMARY_CONTAINER_L_HEX="#001D36"
            C_ON_PRIMARY_CONTAINER_D="red: 0.820, green: 0.894, blue: 1.000, alpha: 1"
            C_ON_PRIMARY_CONTAINER_D_HEX="#D1E4FF"
            C_SECONDARY_L="red: 0.325, green: 0.373, blue: 0.439, alpha: 1"
            C_SECONDARY_L_HEX="#535F70"
            C_SECONDARY_D="red: 0.733, green: 0.780, blue: 0.859, alpha: 1"
            C_SECONDARY_D_HEX="#BBC7DB"
            C_ON_SECONDARY_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_SECONDARY_L_HEX="#FFFFFF"
            C_ON_SECONDARY_D="red: 0.145, green: 0.192, blue: 0.251, alpha: 1"
            C_ON_SECONDARY_D_HEX="#253140"
            C_SECONDARY_CONTAINER_L="red: 0.843, green: 0.890, blue: 0.973, alpha: 1"
            C_SECONDARY_CONTAINER_L_HEX="#D7E3F8"
            C_SECONDARY_CONTAINER_D="red: 0.231, green: 0.282, blue: 0.345, alpha: 1"
            C_SECONDARY_CONTAINER_D_HEX="#3B4858"
            C_ON_SECONDARY_CONTAINER_L="red: 0.063, green: 0.110, blue: 0.169, alpha: 1"
            C_ON_SECONDARY_CONTAINER_L_HEX="#101C2B"
            C_ON_SECONDARY_CONTAINER_D="red: 0.843, green: 0.890, blue: 0.973, alpha: 1"
            C_ON_SECONDARY_CONTAINER_D_HEX="#D7E3F8"
            C_TERTIARY_L="red: 0.420, green: 0.341, blue: 0.471, alpha: 1"
            C_TERTIARY_L_HEX="#6B5778"
            C_TERTIARY_D="red: 0.843, green: 0.745, blue: 0.894, alpha: 1"
            C_TERTIARY_D_HEX="#D7BEE4"
            C_ON_TERTIARY_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_TERTIARY_L_HEX="#FFFFFF"
            C_ON_TERTIARY_D="red: 0.231, green: 0.161, blue: 0.282, alpha: 1"
            C_ON_TERTIARY_D_HEX="#3B2948"
            C_TERTIARY_CONTAINER_L="red: 0.953, green: 0.855, blue: 1.000, alpha: 1"
            C_TERTIARY_CONTAINER_L_HEX="#F3DAFF"
            C_TERTIARY_CONTAINER_D="red: 0.322, green: 0.247, blue: 0.373, alpha: 1"
            C_TERTIARY_CONTAINER_D_HEX="#523F5F"
            C_ON_TERTIARY_CONTAINER_L="red: 0.145, green: 0.078, blue: 0.192, alpha: 1"
            C_ON_TERTIARY_CONTAINER_L_HEX="#251431"
            C_ON_TERTIARY_CONTAINER_D="red: 0.953, green: 0.855, blue: 1.000, alpha: 1"
            C_ON_TERTIARY_CONTAINER_D_HEX="#F3DAFF"
            C_ERROR_L="red: 0.729, green: 0.102, blue: 0.102, alpha: 1"
            C_ERROR_L_HEX="#BA1A1A"
            C_ERROR_D="red: 1.000, green: 0.706, blue: 0.671, alpha: 1"
            C_ERROR_D_HEX="#FFB4AB"
            C_ON_ERROR_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_ERROR_L_HEX="#FFFFFF"
            C_ON_ERROR_D="red: 0.412, green: 0.000, blue: 0.020, alpha: 1"
            C_ON_ERROR_D_HEX="#690005"
            C_ERROR_CONTAINER_L="red: 1.000, green: 0.855, blue: 0.839, alpha: 1"
            C_ERROR_CONTAINER_L_HEX="#FFDAD6"
            C_ERROR_CONTAINER_D="red: 0.576, green: 0.000, blue: 0.039, alpha: 1"
            C_ERROR_CONTAINER_D_HEX="#93000A"
            C_ON_ERROR_CONTAINER_L="red: 0.255, green: 0.000, blue: 0.008, alpha: 1"
            C_ON_ERROR_CONTAINER_L_HEX="#410002"
            C_ON_ERROR_CONTAINER_D="red: 1.000, green: 0.706, blue: 0.671, alpha: 1"
            C_ON_ERROR_CONTAINER_D_HEX="#FFB4AB"
            C_SURFACE_L="red: 0.992, green: 0.988, blue: 1.000, alpha: 1"
            C_SURFACE_L_HEX="#FDFCFF"
            C_SURFACE_D="red: 0.102, green: 0.110, blue: 0.118, alpha: 1"
            C_SURFACE_D_HEX="#1A1C1E"
            C_ON_SURFACE_L="red: 0.102, green: 0.110, blue: 0.118, alpha: 1"
            C_ON_SURFACE_L_HEX="#1A1C1E"
            C_ON_SURFACE_D="red: 0.886, green: 0.886, blue: 0.902, alpha: 1"
            C_ON_SURFACE_D_HEX="#E2E2E6"
            C_SURFACE_VARIANT_L="red: 0.875, green: 0.886, blue: 0.922, alpha: 1"
            C_SURFACE_VARIANT_L_HEX="#DFE2EB"
            C_SURFACE_VARIANT_D="red: 0.263, green: 0.278, blue: 0.306, alpha: 1"
            C_SURFACE_VARIANT_D_HEX="#43474E"
            C_ON_SURFACE_VARIANT_L="red: 0.263, green: 0.278, blue: 0.306, alpha: 1"
            C_ON_SURFACE_VARIANT_L_HEX="#43474E"
            C_ON_SURFACE_VARIANT_D="red: 0.765, green: 0.776, blue: 0.812, alpha: 1"
            C_ON_SURFACE_VARIANT_D_HEX="#C3C6CF"
            C_OUTLINE_L="red: 0.451, green: 0.467, blue: 0.498, alpha: 1"
            C_OUTLINE_L_HEX="#73777F"
            C_OUTLINE_D="red: 0.553, green: 0.569, blue: 0.600, alpha: 1"
            C_OUTLINE_D_HEX="#8D9199"
            C_OUTLINE_VARIANT_L="red: 0.765, green: 0.776, blue: 0.812, alpha: 1"
            C_OUTLINE_VARIANT_L_HEX="#C3C6CF"
            C_OUTLINE_VARIANT_D="red: 0.263, green: 0.278, blue: 0.306, alpha: 1"
            C_OUTLINE_VARIANT_D_HEX="#43474E"
            C_BACKGROUND_L="red: 0.992, green: 0.988, blue: 1.000, alpha: 1"
            C_BACKGROUND_L_HEX="#FDFCFF"
            C_BACKGROUND_D="red: 0.102, green: 0.110, blue: 0.118, alpha: 1"
            C_BACKGROUND_D_HEX="#1A1C1E"
            C_ON_BACKGROUND_L="red: 0.102, green: 0.110, blue: 0.118, alpha: 1"
            C_ON_BACKGROUND_L_HEX="#1A1C1E"
            C_ON_BACKGROUND_D="red: 0.886, green: 0.886, blue: 0.902, alpha: 1"
            C_ON_BACKGROUND_D_HEX="#E2E2E6"
            C_INVERSE_SURFACE_L="red: 0.184, green: 0.188, blue: 0.200, alpha: 1"
            C_INVERSE_SURFACE_L_HEX="#2F3033"
            C_INVERSE_SURFACE_D="red: 0.886, green: 0.886, blue: 0.902, alpha: 1"
            C_INVERSE_SURFACE_D_HEX="#E2E2E6"
            C_INVERSE_ON_SURFACE_L="red: 0.945, green: 0.941, blue: 0.957, alpha: 1"
            C_INVERSE_ON_SURFACE_L_HEX="#F1F0F4"
            C_INVERSE_ON_SURFACE_D="red: 0.184, green: 0.188, blue: 0.200, alpha: 1"
            C_INVERSE_ON_SURFACE_D_HEX="#2F3033"
            C_INVERSE_PRIMARY_L="red: 0.624, green: 0.792, blue: 1.000, alpha: 1"
            C_INVERSE_PRIMARY_L_HEX="#9FCAFF"
            C_INVERSE_PRIMARY_D="red: 0.000, green: 0.380, blue: 0.643, alpha: 1"
            C_INVERSE_PRIMARY_D_HEX="#0061A4"
            C_SURFACE_DIM_L="red: 0.855, green: 0.855, blue: 0.867, alpha: 1"
            C_SURFACE_DIM_L_HEX="#DADADD"
            C_SURFACE_DIM_D="red: 0.071, green: 0.075, blue: 0.086, alpha: 1"
            C_SURFACE_DIM_D_HEX="#121316"
            C_SURFACE_BRIGHT_L="red: 0.980, green: 0.976, blue: 0.988, alpha: 1"
            C_SURFACE_BRIGHT_L_HEX="#FAF9FC"
            C_SURFACE_BRIGHT_D="red: 0.220, green: 0.224, blue: 0.235, alpha: 1"
            C_SURFACE_BRIGHT_D_HEX="#38393C"
            C_SURFACE_CONTAINER_L="red: 0.933, green: 0.929, blue: 0.945, alpha: 1"
            C_SURFACE_CONTAINER_L_HEX="#EEEDF1"
            C_SURFACE_CONTAINER_D="red: 0.118, green: 0.125, blue: 0.133, alpha: 1"
            C_SURFACE_CONTAINER_D_HEX="#1E2022"
            C_SURFACE_CONTAINER_LOW_L="red: 0.957, green: 0.953, blue: 0.969, alpha: 1"
            C_SURFACE_CONTAINER_LOW_L_HEX="#F4F3F7"
            C_SURFACE_CONTAINER_LOW_D="red: 0.102, green: 0.110, blue: 0.118, alpha: 1"
            C_SURFACE_CONTAINER_LOW_D_HEX="#1A1C1E"
            C_SURFACE_CONTAINER_HIGH_L="red: 0.910, green: 0.910, blue: 0.922, alpha: 1"
            C_SURFACE_CONTAINER_HIGH_L_HEX="#E8E8EB"
            C_SURFACE_CONTAINER_HIGH_D="red: 0.157, green: 0.165, blue: 0.176, alpha: 1"
            C_SURFACE_CONTAINER_HIGH_D_HEX="#282A2D"
            C_SCRIM_L="red: 0.000, green: 0.000, blue: 0.000, alpha: 1"
            C_SCRIM_L_HEX="#000000"
            C_SCRIM_D="red: 0.000, green: 0.000, blue: 0.000, alpha: 1"
            C_SCRIM_D_HEX="#000000"
            ;;
        purple)
            C_PRIMARY_L="red: 0.404, green: 0.314, blue: 0.643, alpha: 1"
            C_PRIMARY_L_HEX="#6750A4"
            C_PRIMARY_D="red: 0.812, green: 0.737, blue: 1.000, alpha: 1"
            C_PRIMARY_D_HEX="#CFBCFF"
            C_ON_PRIMARY_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_PRIMARY_L_HEX="#FFFFFF"
            C_ON_PRIMARY_D="red: 0.220, green: 0.118, blue: 0.447, alpha: 1"
            C_ON_PRIMARY_D_HEX="#381E72"
            C_PRIMARY_CONTAINER_L="red: 0.914, green: 0.867, blue: 1.000, alpha: 1"
            C_PRIMARY_CONTAINER_L_HEX="#E9DDFF"
            C_PRIMARY_CONTAINER_D="red: 0.310, green: 0.216, blue: 0.541, alpha: 1"
            C_PRIMARY_CONTAINER_D_HEX="#4F378A"
            C_ON_PRIMARY_CONTAINER_L="red: 0.133, green: 0.000, blue: 0.365, alpha: 1"
            C_ON_PRIMARY_CONTAINER_L_HEX="#22005D"
            C_ON_PRIMARY_CONTAINER_D="red: 0.914, green: 0.867, blue: 1.000, alpha: 1"
            C_ON_PRIMARY_CONTAINER_D_HEX="#E9DDFF"
            C_SECONDARY_L="red: 0.384, green: 0.357, blue: 0.443, alpha: 1"
            C_SECONDARY_L_HEX="#625B71"
            C_SECONDARY_D="red: 0.796, green: 0.761, blue: 0.859, alpha: 1"
            C_SECONDARY_D_HEX="#CBC2DB"
            C_ON_SECONDARY_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_SECONDARY_L_HEX="#FFFFFF"
            C_ON_SECONDARY_D="red: 0.200, green: 0.176, blue: 0.255, alpha: 1"
            C_ON_SECONDARY_D_HEX="#332D41"
            C_SECONDARY_CONTAINER_L="red: 0.910, green: 0.871, blue: 0.973, alpha: 1"
            C_SECONDARY_CONTAINER_L_HEX="#E8DEF8"
            C_SECONDARY_CONTAINER_D="red: 0.290, green: 0.267, blue: 0.345, alpha: 1"
            C_SECONDARY_CONTAINER_D_HEX="#4A4458"
            C_ON_SECONDARY_CONTAINER_L="red: 0.118, green: 0.098, blue: 0.169, alpha: 1"
            C_ON_SECONDARY_CONTAINER_L_HEX="#1E192B"
            C_ON_SECONDARY_CONTAINER_D="red: 0.910, green: 0.871, blue: 0.973, alpha: 1"
            C_ON_SECONDARY_CONTAINER_D_HEX="#E8DEF8"
            C_TERTIARY_L="red: 0.494, green: 0.322, blue: 0.376, alpha: 1"
            C_TERTIARY_L_HEX="#7E5260"
            C_TERTIARY_D="red: 0.937, green: 0.722, blue: 0.784, alpha: 1"
            C_TERTIARY_D_HEX="#EFB8C8"
            C_ON_TERTIARY_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_TERTIARY_L_HEX="#FFFFFF"
            C_ON_TERTIARY_D="red: 0.290, green: 0.145, blue: 0.196, alpha: 1"
            C_ON_TERTIARY_D_HEX="#4A2532"
            C_TERTIARY_CONTAINER_L="red: 1.000, green: 0.851, blue: 0.890, alpha: 1"
            C_TERTIARY_CONTAINER_L_HEX="#FFD9E3"
            C_TERTIARY_CONTAINER_D="red: 0.388, green: 0.231, blue: 0.282, alpha: 1"
            C_TERTIARY_CONTAINER_D_HEX="#633B48"
            C_ON_TERTIARY_CONTAINER_L="red: 0.192, green: 0.063, blue: 0.114, alpha: 1"
            C_ON_TERTIARY_CONTAINER_L_HEX="#31101D"
            C_ON_TERTIARY_CONTAINER_D="red: 1.000, green: 0.851, blue: 0.890, alpha: 1"
            C_ON_TERTIARY_CONTAINER_D_HEX="#FFD9E3"
            C_ERROR_L="red: 0.729, green: 0.102, blue: 0.102, alpha: 1"
            C_ERROR_L_HEX="#BA1A1A"
            C_ERROR_D="red: 1.000, green: 0.706, blue: 0.671, alpha: 1"
            C_ERROR_D_HEX="#FFB4AB"
            C_ON_ERROR_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_ERROR_L_HEX="#FFFFFF"
            C_ON_ERROR_D="red: 0.412, green: 0.000, blue: 0.020, alpha: 1"
            C_ON_ERROR_D_HEX="#690005"
            C_ERROR_CONTAINER_L="red: 1.000, green: 0.855, blue: 0.839, alpha: 1"
            C_ERROR_CONTAINER_L_HEX="#FFDAD6"
            C_ERROR_CONTAINER_D="red: 0.576, green: 0.000, blue: 0.039, alpha: 1"
            C_ERROR_CONTAINER_D_HEX="#93000A"
            C_ON_ERROR_CONTAINER_L="red: 0.255, green: 0.000, blue: 0.008, alpha: 1"
            C_ON_ERROR_CONTAINER_L_HEX="#410002"
            C_ON_ERROR_CONTAINER_D="red: 1.000, green: 0.706, blue: 0.671, alpha: 1"
            C_ON_ERROR_CONTAINER_D_HEX="#FFB4AB"
            C_SURFACE_L="red: 1.000, green: 0.984, blue: 1.000, alpha: 1"
            C_SURFACE_L_HEX="#FFFBFF"
            C_SURFACE_D="red: 0.110, green: 0.106, blue: 0.118, alpha: 1"
            C_SURFACE_D_HEX="#1C1B1E"
            C_ON_SURFACE_L="red: 0.110, green: 0.106, blue: 0.118, alpha: 1"
            C_ON_SURFACE_L_HEX="#1C1B1E"
            C_ON_SURFACE_D="red: 0.902, green: 0.882, blue: 0.902, alpha: 1"
            C_ON_SURFACE_D_HEX="#E6E1E6"
            C_SURFACE_VARIANT_L="red: 0.906, green: 0.878, blue: 0.922, alpha: 1"
            C_SURFACE_VARIANT_L_HEX="#E7E0EB"
            C_SURFACE_VARIANT_D="red: 0.286, green: 0.271, blue: 0.306, alpha: 1"
            C_SURFACE_VARIANT_D_HEX="#49454E"
            C_ON_SURFACE_VARIANT_L="red: 0.286, green: 0.271, blue: 0.306, alpha: 1"
            C_ON_SURFACE_VARIANT_L_HEX="#49454E"
            C_ON_SURFACE_VARIANT_D="red: 0.792, green: 0.769, blue: 0.812, alpha: 1"
            C_ON_SURFACE_VARIANT_D_HEX="#CAC4CF"
            C_OUTLINE_L="red: 0.478, green: 0.459, blue: 0.498, alpha: 1"
            C_OUTLINE_L_HEX="#7A757F"
            C_OUTLINE_D="red: 0.580, green: 0.561, blue: 0.600, alpha: 1"
            C_OUTLINE_D_HEX="#948F99"
            C_OUTLINE_VARIANT_L="red: 0.792, green: 0.769, blue: 0.812, alpha: 1"
            C_OUTLINE_VARIANT_L_HEX="#CAC4CF"
            C_OUTLINE_VARIANT_D="red: 0.286, green: 0.271, blue: 0.306, alpha: 1"
            C_OUTLINE_VARIANT_D_HEX="#49454E"
            C_BACKGROUND_L="red: 1.000, green: 0.984, blue: 1.000, alpha: 1"
            C_BACKGROUND_L_HEX="#FFFBFF"
            C_BACKGROUND_D="red: 0.110, green: 0.106, blue: 0.118, alpha: 1"
            C_BACKGROUND_D_HEX="#1C1B1E"
            C_ON_BACKGROUND_L="red: 0.110, green: 0.106, blue: 0.118, alpha: 1"
            C_ON_BACKGROUND_L_HEX="#1C1B1E"
            C_ON_BACKGROUND_D="red: 0.902, green: 0.882, blue: 0.902, alpha: 1"
            C_ON_BACKGROUND_D_HEX="#E6E1E6"
            C_INVERSE_SURFACE_L="red: 0.192, green: 0.188, blue: 0.200, alpha: 1"
            C_INVERSE_SURFACE_L_HEX="#313033"
            C_INVERSE_SURFACE_D="red: 0.902, green: 0.882, blue: 0.902, alpha: 1"
            C_INVERSE_SURFACE_D_HEX="#E6E1E6"
            C_INVERSE_ON_SURFACE_L="red: 0.957, green: 0.937, blue: 0.957, alpha: 1"
            C_INVERSE_ON_SURFACE_L_HEX="#F4EFF4"
            C_INVERSE_ON_SURFACE_D="red: 0.192, green: 0.188, blue: 0.200, alpha: 1"
            C_INVERSE_ON_SURFACE_D_HEX="#313033"
            C_INVERSE_PRIMARY_L="red: 0.812, green: 0.737, blue: 1.000, alpha: 1"
            C_INVERSE_PRIMARY_L_HEX="#CFBCFF"
            C_INVERSE_PRIMARY_D="red: 0.404, green: 0.314, blue: 0.643, alpha: 1"
            C_INVERSE_PRIMARY_D_HEX="#6750A4"
            C_SURFACE_DIM_L="red: 0.867, green: 0.847, blue: 0.867, alpha: 1"
            C_SURFACE_DIM_L_HEX="#DDD8DD"
            C_SURFACE_DIM_D="red: 0.078, green: 0.075, blue: 0.086, alpha: 1"
            C_SURFACE_DIM_D_HEX="#141316"
            C_SURFACE_BRIGHT_L="red: 0.992, green: 0.973, blue: 0.992, alpha: 1"
            C_SURFACE_BRIGHT_L_HEX="#FDF8FD"
            C_SURFACE_BRIGHT_D="red: 0.227, green: 0.220, blue: 0.235, alpha: 1"
            C_SURFACE_BRIGHT_D_HEX="#3A383C"
            C_SURFACE_CONTAINER_L="red: 0.949, green: 0.925, blue: 0.945, alpha: 1"
            C_SURFACE_CONTAINER_L_HEX="#F2ECF1"
            C_SURFACE_CONTAINER_D="red: 0.125, green: 0.122, blue: 0.133, alpha: 1"
            C_SURFACE_CONTAINER_D_HEX="#201F22"
            C_SURFACE_CONTAINER_LOW_L="red: 0.969, green: 0.949, blue: 0.969, alpha: 1"
            C_SURFACE_CONTAINER_LOW_L_HEX="#F7F2F7"
            C_SURFACE_CONTAINER_LOW_D="red: 0.110, green: 0.106, blue: 0.118, alpha: 1"
            C_SURFACE_CONTAINER_LOW_D_HEX="#1C1B1E"
            C_SURFACE_CONTAINER_HIGH_L="red: 0.925, green: 0.906, blue: 0.922, alpha: 1"
            C_SURFACE_CONTAINER_HIGH_L_HEX="#ECE7EB"
            C_SURFACE_CONTAINER_HIGH_D="red: 0.169, green: 0.161, blue: 0.176, alpha: 1"
            C_SURFACE_CONTAINER_HIGH_D_HEX="#2B292D"
            C_SCRIM_L="red: 0.000, green: 0.000, blue: 0.000, alpha: 1"
            C_SCRIM_L_HEX="#000000"
            C_SCRIM_D="red: 0.000, green: 0.000, blue: 0.000, alpha: 1"
            C_SCRIM_D_HEX="#000000"
            ;;
        green)
            C_PRIMARY_L="red: 0.220, green: 0.416, blue: 0.122, alpha: 1"
            C_PRIMARY_L_HEX="#386A1F"
            C_PRIMARY_D="red: 0.612, green: 0.839, blue: 0.494, alpha: 1"
            C_PRIMARY_D_HEX="#9CD67E"
            C_ON_PRIMARY_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_PRIMARY_L_HEX="#FFFFFF"
            C_ON_PRIMARY_D="red: 0.067, green: 0.220, blue: 0.000, alpha: 1"
            C_ON_PRIMARY_D_HEX="#113800"
            C_PRIMARY_CONTAINER_L="red: 0.722, green: 0.953, blue: 0.592, alpha: 1"
            C_PRIMARY_CONTAINER_L_HEX="#B8F397"
            C_PRIMARY_CONTAINER_D="red: 0.125, green: 0.318, blue: 0.027, alpha: 1"
            C_PRIMARY_CONTAINER_D_HEX="#205107"
            C_ON_PRIMARY_CONTAINER_L="red: 0.027, green: 0.129, blue: 0.000, alpha: 1"
            C_ON_PRIMARY_CONTAINER_L_HEX="#072100"
            C_ON_PRIMARY_CONTAINER_D="red: 0.722, green: 0.953, blue: 0.592, alpha: 1"
            C_ON_PRIMARY_CONTAINER_D_HEX="#B8F397"
            C_SECONDARY_L="red: 0.333, green: 0.384, blue: 0.298, alpha: 1"
            C_SECONDARY_L_HEX="#55624C"
            C_SECONDARY_D="red: 0.741, green: 0.796, blue: 0.690, alpha: 1"
            C_SECONDARY_D_HEX="#BDCBB0"
            C_ON_SECONDARY_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_SECONDARY_L_HEX="#FFFFFF"
            C_ON_SECONDARY_D="red: 0.157, green: 0.204, blue: 0.125, alpha: 1"
            C_ON_SECONDARY_D_HEX="#283420"
            C_SECONDARY_CONTAINER_L="red: 0.847, green: 0.906, blue: 0.796, alpha: 1"
            C_SECONDARY_CONTAINER_L_HEX="#D8E7CB"
            C_SECONDARY_CONTAINER_D="red: 0.243, green: 0.290, blue: 0.208, alpha: 1"
            C_SECONDARY_CONTAINER_D_HEX="#3E4A35"
            C_ON_SECONDARY_CONTAINER_L="red: 0.075, green: 0.122, blue: 0.051, alpha: 1"
            C_ON_SECONDARY_CONTAINER_L_HEX="#131F0D"
            C_ON_SECONDARY_CONTAINER_D="red: 0.847, green: 0.906, blue: 0.796, alpha: 1"
            C_ON_SECONDARY_CONTAINER_D_HEX="#D8E7CB"
            C_TERTIARY_L="red: 0.220, green: 0.400, blue: 0.400, alpha: 1"
            C_TERTIARY_L_HEX="#386666"
            C_TERTIARY_D="red: 0.627, green: 0.812, blue: 0.816, alpha: 1"
            C_TERTIARY_D_HEX="#A0CFD0"
            C_ON_TERTIARY_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_TERTIARY_L_HEX="#FFFFFF"
            C_ON_TERTIARY_D="red: 0.000, green: 0.216, blue: 0.220, alpha: 1"
            C_ON_TERTIARY_D_HEX="#003738"
            C_TERTIARY_CONTAINER_L="red: 0.733, green: 0.922, blue: 0.925, alpha: 1"
            C_TERTIARY_CONTAINER_L_HEX="#BBEBEC"
            C_TERTIARY_CONTAINER_D="red: 0.118, green: 0.306, blue: 0.310, alpha: 1"
            C_TERTIARY_CONTAINER_D_HEX="#1E4E4F"
            C_ON_TERTIARY_CONTAINER_L="red: 0.000, green: 0.125, blue: 0.125, alpha: 1"
            C_ON_TERTIARY_CONTAINER_L_HEX="#002020"
            C_ON_TERTIARY_CONTAINER_D="red: 0.733, green: 0.922, blue: 0.925, alpha: 1"
            C_ON_TERTIARY_CONTAINER_D_HEX="#BBEBEC"
            C_ERROR_L="red: 0.729, green: 0.102, blue: 0.102, alpha: 1"
            C_ERROR_L_HEX="#BA1A1A"
            C_ERROR_D="red: 1.000, green: 0.706, blue: 0.671, alpha: 1"
            C_ERROR_D_HEX="#FFB4AB"
            C_ON_ERROR_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_ERROR_L_HEX="#FFFFFF"
            C_ON_ERROR_D="red: 0.412, green: 0.000, blue: 0.020, alpha: 1"
            C_ON_ERROR_D_HEX="#690005"
            C_ERROR_CONTAINER_L="red: 1.000, green: 0.855, blue: 0.839, alpha: 1"
            C_ERROR_CONTAINER_L_HEX="#FFDAD6"
            C_ERROR_CONTAINER_D="red: 0.576, green: 0.000, blue: 0.039, alpha: 1"
            C_ERROR_CONTAINER_D_HEX="#93000A"
            C_ON_ERROR_CONTAINER_L="red: 0.255, green: 0.000, blue: 0.008, alpha: 1"
            C_ON_ERROR_CONTAINER_L_HEX="#410002"
            C_ON_ERROR_CONTAINER_D="red: 1.000, green: 0.706, blue: 0.671, alpha: 1"
            C_ON_ERROR_CONTAINER_D_HEX="#FFB4AB"
            C_SURFACE_L="red: 0.992, green: 0.992, blue: 0.965, alpha: 1"
            C_SURFACE_L_HEX="#FDFDF6"
            C_SURFACE_D="red: 0.102, green: 0.110, blue: 0.094, alpha: 1"
            C_SURFACE_D_HEX="#1A1C18"
            C_ON_SURFACE_L="red: 0.102, green: 0.110, blue: 0.094, alpha: 1"
            C_ON_SURFACE_L_HEX="#1A1C18"
            C_ON_SURFACE_D="red: 0.890, green: 0.890, blue: 0.863, alpha: 1"
            C_ON_SURFACE_D_HEX="#E3E3DC"
            C_SURFACE_VARIANT_L="red: 0.875, green: 0.894, blue: 0.843, alpha: 1"
            C_SURFACE_VARIANT_L_HEX="#DFE4D7"
            C_SURFACE_VARIANT_D="red: 0.263, green: 0.282, blue: 0.243, alpha: 1"
            C_SURFACE_VARIANT_D_HEX="#43483E"
            C_ON_SURFACE_VARIANT_L="red: 0.263, green: 0.282, blue: 0.243, alpha: 1"
            C_ON_SURFACE_VARIANT_L_HEX="#43483E"
            C_ON_SURFACE_VARIANT_D="red: 0.765, green: 0.784, blue: 0.733, alpha: 1"
            C_ON_SURFACE_VARIANT_D_HEX="#C3C8BB"
            C_OUTLINE_L="red: 0.455, green: 0.475, blue: 0.427, alpha: 1"
            C_OUTLINE_L_HEX="#74796D"
            C_OUTLINE_D="red: 0.553, green: 0.573, blue: 0.525, alpha: 1"
            C_OUTLINE_D_HEX="#8D9286"
            C_OUTLINE_VARIANT_L="red: 0.765, green: 0.784, blue: 0.733, alpha: 1"
            C_OUTLINE_VARIANT_L_HEX="#C3C8BB"
            C_OUTLINE_VARIANT_D="red: 0.263, green: 0.282, blue: 0.243, alpha: 1"
            C_OUTLINE_VARIANT_D_HEX="#43483E"
            C_BACKGROUND_L="red: 0.992, green: 0.992, blue: 0.965, alpha: 1"
            C_BACKGROUND_L_HEX="#FDFDF6"
            C_BACKGROUND_D="red: 0.102, green: 0.110, blue: 0.094, alpha: 1"
            C_BACKGROUND_D_HEX="#1A1C18"
            C_ON_BACKGROUND_L="red: 0.102, green: 0.110, blue: 0.094, alpha: 1"
            C_ON_BACKGROUND_L_HEX="#1A1C18"
            C_ON_BACKGROUND_D="red: 0.890, green: 0.890, blue: 0.863, alpha: 1"
            C_ON_BACKGROUND_D_HEX="#E3E3DC"
            C_INVERSE_SURFACE_L="red: 0.184, green: 0.192, blue: 0.176, alpha: 1"
            C_INVERSE_SURFACE_L_HEX="#2F312D"
            C_INVERSE_SURFACE_D="red: 0.890, green: 0.890, blue: 0.863, alpha: 1"
            C_INVERSE_SURFACE_D_HEX="#E3E3DC"
            C_INVERSE_ON_SURFACE_L="red: 0.945, green: 0.945, blue: 0.918, alpha: 1"
            C_INVERSE_ON_SURFACE_L_HEX="#F1F1EA"
            C_INVERSE_ON_SURFACE_D="red: 0.184, green: 0.192, blue: 0.176, alpha: 1"
            C_INVERSE_ON_SURFACE_D_HEX="#2F312D"
            C_INVERSE_PRIMARY_L="red: 0.612, green: 0.839, blue: 0.494, alpha: 1"
            C_INVERSE_PRIMARY_L_HEX="#9CD67E"
            C_INVERSE_PRIMARY_D="red: 0.220, green: 0.416, blue: 0.122, alpha: 1"
            C_INVERSE_PRIMARY_D_HEX="#386A1F"
            C_SURFACE_DIM_L="red: 0.855, green: 0.855, blue: 0.831, alpha: 1"
            C_SURFACE_DIM_L_HEX="#DADAD4"
            C_SURFACE_DIM_D="red: 0.071, green: 0.078, blue: 0.063, alpha: 1"
            C_SURFACE_DIM_D_HEX="#121410"
            C_SURFACE_BRIGHT_L="red: 0.980, green: 0.980, blue: 0.953, alpha: 1"
            C_SURFACE_BRIGHT_L_HEX="#FAFAF3"
            C_SURFACE_BRIGHT_D="red: 0.220, green: 0.227, blue: 0.208, alpha: 1"
            C_SURFACE_BRIGHT_D_HEX="#383A35"
            C_SURFACE_CONTAINER_L="red: 0.933, green: 0.933, blue: 0.906, alpha: 1"
            C_SURFACE_CONTAINER_L_HEX="#EEEEE7"
            C_SURFACE_CONTAINER_D="red: 0.118, green: 0.125, blue: 0.110, alpha: 1"
            C_SURFACE_CONTAINER_D_HEX="#1E201C"
            C_SURFACE_CONTAINER_LOW_L="red: 0.957, green: 0.957, blue: 0.929, alpha: 1"
            C_SURFACE_CONTAINER_LOW_L_HEX="#F4F4ED"
            C_SURFACE_CONTAINER_LOW_D="red: 0.102, green: 0.110, blue: 0.094, alpha: 1"
            C_SURFACE_CONTAINER_LOW_D_HEX="#1A1C18"
            C_SURFACE_CONTAINER_HIGH_L="red: 0.910, green: 0.914, blue: 0.886, alpha: 1"
            C_SURFACE_CONTAINER_HIGH_L_HEX="#E8E9E2"
            C_SURFACE_CONTAINER_HIGH_D="red: 0.161, green: 0.169, blue: 0.149, alpha: 1"
            C_SURFACE_CONTAINER_HIGH_D_HEX="#292B26"
            C_SCRIM_L="red: 0.000, green: 0.000, blue: 0.000, alpha: 1"
            C_SCRIM_L_HEX="#000000"
            C_SCRIM_D="red: 0.000, green: 0.000, blue: 0.000, alpha: 1"
            C_SCRIM_D_HEX="#000000"
            ;;
        red)
            C_PRIMARY_L="red: 0.729, green: 0.102, blue: 0.102, alpha: 1"
            C_PRIMARY_L_HEX="#BA1A1A"
            C_PRIMARY_D="red: 1.000, green: 0.706, blue: 0.671, alpha: 1"
            C_PRIMARY_D_HEX="#FFB4AB"
            C_ON_PRIMARY_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_PRIMARY_L_HEX="#FFFFFF"
            C_ON_PRIMARY_D="red: 0.412, green: 0.000, blue: 0.016, alpha: 1"
            C_ON_PRIMARY_D_HEX="#690004"
            C_PRIMARY_CONTAINER_L="red: 1.000, green: 0.855, blue: 0.835, alpha: 1"
            C_PRIMARY_CONTAINER_L_HEX="#FFDAD5"
            C_PRIMARY_CONTAINER_D="red: 0.576, green: 0.000, blue: 0.035, alpha: 1"
            C_PRIMARY_CONTAINER_D_HEX="#930009"
            C_ON_PRIMARY_CONTAINER_L="red: 0.255, green: 0.000, blue: 0.008, alpha: 1"
            C_ON_PRIMARY_CONTAINER_L_HEX="#410002"
            C_ON_PRIMARY_CONTAINER_D="red: 1.000, green: 0.855, blue: 0.835, alpha: 1"
            C_ON_PRIMARY_CONTAINER_D_HEX="#FFDAD5"
            C_SECONDARY_L="red: 0.467, green: 0.337, blue: 0.322, alpha: 1"
            C_SECONDARY_L_HEX="#775652"
            C_SECONDARY_D="red: 0.906, green: 0.741, blue: 0.718, alpha: 1"
            C_SECONDARY_D_HEX="#E7BDB7"
            C_ON_SECONDARY_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_SECONDARY_L_HEX="#FFFFFF"
            C_ON_SECONDARY_D="red: 0.267, green: 0.161, blue: 0.149, alpha: 1"
            C_ON_SECONDARY_D_HEX="#442926"
            C_SECONDARY_CONTAINER_L="red: 1.000, green: 0.855, blue: 0.835, alpha: 1"
            C_SECONDARY_CONTAINER_L_HEX="#FFDAD5"
            C_SECONDARY_CONTAINER_D="red: 0.365, green: 0.247, blue: 0.235, alpha: 1"
            C_SECONDARY_CONTAINER_D_HEX="#5D3F3C"
            C_ON_SECONDARY_CONTAINER_L="red: 0.173, green: 0.082, blue: 0.071, alpha: 1"
            C_ON_SECONDARY_CONTAINER_L_HEX="#2C1512"
            C_ON_SECONDARY_CONTAINER_D="red: 1.000, green: 0.855, blue: 0.835, alpha: 1"
            C_ON_SECONDARY_CONTAINER_D_HEX="#FFDAD5"
            C_TERTIARY_L="red: 0.443, green: 0.357, blue: 0.180, alpha: 1"
            C_TERTIARY_L_HEX="#715B2E"
            C_TERTIARY_D="red: 0.878, green: 0.765, blue: 0.549, alpha: 1"
            C_TERTIARY_D_HEX="#E0C38C"
            C_ON_TERTIARY_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_TERTIARY_L_HEX="#FFFFFF"
            C_ON_TERTIARY_D="red: 0.247, green: 0.180, blue: 0.016, alpha: 1"
            C_ON_TERTIARY_D_HEX="#3F2E04"
            C_TERTIARY_CONTAINER_L="red: 0.992, green: 0.875, blue: 0.651, alpha: 1"
            C_TERTIARY_CONTAINER_L_HEX="#FDDFA6"
            C_TERTIARY_CONTAINER_D="red: 0.341, green: 0.267, blue: 0.098, alpha: 1"
            C_TERTIARY_CONTAINER_D_HEX="#574419"
            C_ON_TERTIARY_CONTAINER_L="red: 0.149, green: 0.102, blue: 0.000, alpha: 1"
            C_ON_TERTIARY_CONTAINER_L_HEX="#261A00"
            C_ON_TERTIARY_CONTAINER_D="red: 0.992, green: 0.875, blue: 0.651, alpha: 1"
            C_ON_TERTIARY_CONTAINER_D_HEX="#FDDFA6"
            C_ERROR_L="red: 0.729, green: 0.102, blue: 0.102, alpha: 1"
            C_ERROR_L_HEX="#BA1A1A"
            C_ERROR_D="red: 1.000, green: 0.706, blue: 0.671, alpha: 1"
            C_ERROR_D_HEX="#FFB4AB"
            C_ON_ERROR_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_ERROR_L_HEX="#FFFFFF"
            C_ON_ERROR_D="red: 0.412, green: 0.000, blue: 0.020, alpha: 1"
            C_ON_ERROR_D_HEX="#690005"
            C_ERROR_CONTAINER_L="red: 1.000, green: 0.855, blue: 0.839, alpha: 1"
            C_ERROR_CONTAINER_L_HEX="#FFDAD6"
            C_ERROR_CONTAINER_D="red: 0.576, green: 0.000, blue: 0.039, alpha: 1"
            C_ERROR_CONTAINER_D_HEX="#93000A"
            C_ON_ERROR_CONTAINER_L="red: 0.255, green: 0.000, blue: 0.008, alpha: 1"
            C_ON_ERROR_CONTAINER_L_HEX="#410002"
            C_ON_ERROR_CONTAINER_D="red: 1.000, green: 0.706, blue: 0.671, alpha: 1"
            C_ON_ERROR_CONTAINER_D_HEX="#FFB4AB"
            C_SURFACE_L="red: 1.000, green: 0.984, blue: 1.000, alpha: 1"
            C_SURFACE_L_HEX="#FFFBFF"
            C_SURFACE_D="red: 0.125, green: 0.102, blue: 0.098, alpha: 1"
            C_SURFACE_D_HEX="#201A19"
            C_ON_SURFACE_L="red: 0.125, green: 0.102, blue: 0.098, alpha: 1"
            C_ON_SURFACE_L_HEX="#201A19"
            C_ON_SURFACE_D="red: 0.929, green: 0.878, blue: 0.871, alpha: 1"
            C_ON_SURFACE_D_HEX="#EDE0DE"
            C_SURFACE_VARIANT_L="red: 0.961, green: 0.867, blue: 0.855, alpha: 1"
            C_SURFACE_VARIANT_L_HEX="#F5DDDA"
            C_SURFACE_VARIANT_D="red: 0.325, green: 0.263, blue: 0.255, alpha: 1"
            C_SURFACE_VARIANT_D_HEX="#534341"
            C_ON_SURFACE_VARIANT_L="red: 0.325, green: 0.263, blue: 0.255, alpha: 1"
            C_ON_SURFACE_VARIANT_L_HEX="#534341"
            C_ON_SURFACE_VARIANT_D="red: 0.847, green: 0.761, blue: 0.749, alpha: 1"
            C_ON_SURFACE_VARIANT_D_HEX="#D8C2BF"
            C_OUTLINE_L="red: 0.522, green: 0.451, blue: 0.443, alpha: 1"
            C_OUTLINE_L_HEX="#857371"
            C_OUTLINE_D="red: 0.627, green: 0.549, blue: 0.541, alpha: 1"
            C_OUTLINE_D_HEX="#A08C8A"
            C_OUTLINE_VARIANT_L="red: 0.847, green: 0.761, blue: 0.749, alpha: 1"
            C_OUTLINE_VARIANT_L_HEX="#D8C2BF"
            C_OUTLINE_VARIANT_D="red: 0.325, green: 0.263, blue: 0.255, alpha: 1"
            C_OUTLINE_VARIANT_D_HEX="#534341"
            C_BACKGROUND_L="red: 1.000, green: 0.984, blue: 1.000, alpha: 1"
            C_BACKGROUND_L_HEX="#FFFBFF"
            C_BACKGROUND_D="red: 0.125, green: 0.102, blue: 0.098, alpha: 1"
            C_BACKGROUND_D_HEX="#201A19"
            C_ON_BACKGROUND_L="red: 0.125, green: 0.102, blue: 0.098, alpha: 1"
            C_ON_BACKGROUND_L_HEX="#201A19"
            C_ON_BACKGROUND_D="red: 0.929, green: 0.878, blue: 0.871, alpha: 1"
            C_ON_BACKGROUND_D_HEX="#EDE0DE"
            C_INVERSE_SURFACE_L="red: 0.212, green: 0.184, blue: 0.180, alpha: 1"
            C_INVERSE_SURFACE_L_HEX="#362F2E"
            C_INVERSE_SURFACE_D="red: 0.929, green: 0.878, blue: 0.871, alpha: 1"
            C_INVERSE_SURFACE_D_HEX="#EDE0DE"
            C_INVERSE_ON_SURFACE_L="red: 0.984, green: 0.933, blue: 0.925, alpha: 1"
            C_INVERSE_ON_SURFACE_L_HEX="#FBEEEC"
            C_INVERSE_ON_SURFACE_D="red: 0.212, green: 0.184, blue: 0.180, alpha: 1"
            C_INVERSE_ON_SURFACE_D_HEX="#362F2E"
            C_INVERSE_PRIMARY_L="red: 1.000, green: 0.706, blue: 0.671, alpha: 1"
            C_INVERSE_PRIMARY_L_HEX="#FFB4AB"
            C_INVERSE_PRIMARY_D="red: 0.729, green: 0.102, blue: 0.102, alpha: 1"
            C_INVERSE_PRIMARY_D_HEX="#BA1A1A"
            C_SURFACE_DIM_L="red: 0.894, green: 0.843, blue: 0.835, alpha: 1"
            C_SURFACE_DIM_L_HEX="#E4D7D5"
            C_SURFACE_DIM_D="red: 0.094, green: 0.071, blue: 0.067, alpha: 1"
            C_SURFACE_DIM_D_HEX="#181211"
            C_SURFACE_BRIGHT_L="red: 1.000, green: 0.973, blue: 0.969, alpha: 1"
            C_SURFACE_BRIGHT_L_HEX="#FFF8F7"
            C_SURFACE_BRIGHT_D="red: 0.247, green: 0.216, blue: 0.212, alpha: 1"
            C_SURFACE_BRIGHT_D_HEX="#3F3736"
            C_SURFACE_CONTAINER_L="red: 0.973, green: 0.922, blue: 0.914, alpha: 1"
            C_SURFACE_CONTAINER_L_HEX="#F8EBE9"
            C_SURFACE_CONTAINER_D="red: 0.145, green: 0.118, blue: 0.114, alpha: 1"
            C_SURFACE_CONTAINER_D_HEX="#251E1D"
            C_SURFACE_CONTAINER_LOW_L="red: 0.996, green: 0.945, blue: 0.937, alpha: 1"
            C_SURFACE_CONTAINER_LOW_L_HEX="#FEF1EF"
            C_SURFACE_CONTAINER_LOW_D="red: 0.125, green: 0.102, blue: 0.098, alpha: 1"
            C_SURFACE_CONTAINER_LOW_D_HEX="#201A19"
            C_SURFACE_CONTAINER_HIGH_L="red: 0.949, green: 0.898, blue: 0.890, alpha: 1"
            C_SURFACE_CONTAINER_HIGH_L_HEX="#F2E5E3"
            C_SURFACE_CONTAINER_HIGH_D="red: 0.184, green: 0.157, blue: 0.153, alpha: 1"
            C_SURFACE_CONTAINER_HIGH_D_HEX="#2F2827"
            C_SCRIM_L="red: 0.000, green: 0.000, blue: 0.000, alpha: 1"
            C_SCRIM_L_HEX="#000000"
            C_SCRIM_D="red: 0.000, green: 0.000, blue: 0.000, alpha: 1"
            C_SCRIM_D_HEX="#000000"
            ;;
        orange)
            C_PRIMARY_L="red: 0.545, green: 0.314, blue: 0.000, alpha: 1"
            C_PRIMARY_L_HEX="#8B5000"
            C_PRIMARY_D="red: 1.000, green: 0.722, blue: 0.443, alpha: 1"
            C_PRIMARY_D_HEX="#FFB871"
            C_ON_PRIMARY_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_PRIMARY_L_HEX="#FFFFFF"
            C_ON_PRIMARY_D="red: 0.290, green: 0.157, blue: 0.000, alpha: 1"
            C_ON_PRIMARY_D_HEX="#4A2800"
            C_PRIMARY_CONTAINER_L="red: 1.000, green: 0.863, blue: 0.745, alpha: 1"
            C_PRIMARY_CONTAINER_L_HEX="#FFDCBE"
            C_PRIMARY_CONTAINER_D="red: 0.416, green: 0.235, blue: 0.000, alpha: 1"
            C_PRIMARY_CONTAINER_D_HEX="#6A3C00"
            C_ON_PRIMARY_CONTAINER_L="red: 0.176, green: 0.086, blue: 0.000, alpha: 1"
            C_ON_PRIMARY_CONTAINER_L_HEX="#2D1600"
            C_ON_PRIMARY_CONTAINER_D="red: 1.000, green: 0.863, blue: 0.745, alpha: 1"
            C_ON_PRIMARY_CONTAINER_D_HEX="#FFDCBE"
            C_SECONDARY_L="red: 0.451, green: 0.353, blue: 0.259, alpha: 1"
            C_SECONDARY_L_HEX="#735A42"
            C_SECONDARY_D="red: 0.882, green: 0.757, blue: 0.643, alpha: 1"
            C_SECONDARY_D_HEX="#E1C1A4"
            C_ON_SECONDARY_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_SECONDARY_L_HEX="#FFFFFF"
            C_ON_SECONDARY_D="red: 0.251, green: 0.173, blue: 0.094, alpha: 1"
            C_ON_SECONDARY_D_HEX="#402C18"
            C_SECONDARY_CONTAINER_L="red: 1.000, green: 0.863, blue: 0.745, alpha: 1"
            C_SECONDARY_CONTAINER_L_HEX="#FFDCBE"
            C_SECONDARY_CONTAINER_D="red: 0.349, green: 0.259, blue: 0.176, alpha: 1"
            C_SECONDARY_CONTAINER_D_HEX="#59422D"
            C_ON_SECONDARY_CONTAINER_L="red: 0.161, green: 0.094, blue: 0.024, alpha: 1"
            C_ON_SECONDARY_CONTAINER_L_HEX="#291806"
            C_ON_SECONDARY_CONTAINER_D="red: 1.000, green: 0.863, blue: 0.745, alpha: 1"
            C_ON_SECONDARY_CONTAINER_D_HEX="#FFDCBE"
            C_TERTIARY_L="red: 0.345, green: 0.388, blue: 0.224, alpha: 1"
            C_TERTIARY_L_HEX="#586339"
            C_TERTIARY_D="red: 0.753, green: 0.800, blue: 0.604, alpha: 1"
            C_TERTIARY_D_HEX="#C0CC9A"
            C_ON_TERTIARY_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_TERTIARY_L_HEX="#FFFFFF"
            C_ON_TERTIARY_D="red: 0.169, green: 0.204, blue: 0.063, alpha: 1"
            C_ON_TERTIARY_D_HEX="#2B3410"
            C_TERTIARY_CONTAINER_L="red: 0.863, green: 0.910, blue: 0.706, alpha: 1"
            C_TERTIARY_CONTAINER_L_HEX="#DCE8B4"
            C_TERTIARY_CONTAINER_D="red: 0.255, green: 0.294, blue: 0.141, alpha: 1"
            C_TERTIARY_CONTAINER_D_HEX="#414B24"
            C_ON_TERTIARY_CONTAINER_L="red: 0.086, green: 0.118, blue: 0.000, alpha: 1"
            C_ON_TERTIARY_CONTAINER_L_HEX="#161E00"
            C_ON_TERTIARY_CONTAINER_D="red: 0.863, green: 0.910, blue: 0.706, alpha: 1"
            C_ON_TERTIARY_CONTAINER_D_HEX="#DCE8B4"
            C_ERROR_L="red: 0.729, green: 0.102, blue: 0.102, alpha: 1"
            C_ERROR_L_HEX="#BA1A1A"
            C_ERROR_D="red: 1.000, green: 0.706, blue: 0.671, alpha: 1"
            C_ERROR_D_HEX="#FFB4AB"
            C_ON_ERROR_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_ERROR_L_HEX="#FFFFFF"
            C_ON_ERROR_D="red: 0.412, green: 0.000, blue: 0.020, alpha: 1"
            C_ON_ERROR_D_HEX="#690005"
            C_ERROR_CONTAINER_L="red: 1.000, green: 0.855, blue: 0.839, alpha: 1"
            C_ERROR_CONTAINER_L_HEX="#FFDAD6"
            C_ERROR_CONTAINER_D="red: 0.576, green: 0.000, blue: 0.039, alpha: 1"
            C_ERROR_CONTAINER_D_HEX="#93000A"
            C_ON_ERROR_CONTAINER_L="red: 0.255, green: 0.000, blue: 0.008, alpha: 1"
            C_ON_ERROR_CONTAINER_L_HEX="#410002"
            C_ON_ERROR_CONTAINER_D="red: 1.000, green: 0.706, blue: 0.671, alpha: 1"
            C_ON_ERROR_CONTAINER_D_HEX="#FFB4AB"
            C_SURFACE_L="red: 1.000, green: 0.984, blue: 1.000, alpha: 1"
            C_SURFACE_L_HEX="#FFFBFF"
            C_SURFACE_D="red: 0.125, green: 0.106, blue: 0.086, alpha: 1"
            C_SURFACE_D_HEX="#201B16"
            C_ON_SURFACE_L="red: 0.125, green: 0.106, blue: 0.086, alpha: 1"
            C_ON_SURFACE_L_HEX="#201B16"
            C_ON_SURFACE_D="red: 0.922, green: 0.878, blue: 0.851, alpha: 1"
            C_ON_SURFACE_D_HEX="#EBE0D9"
            C_SURFACE_VARIANT_L="red: 0.949, green: 0.875, blue: 0.820, alpha: 1"
            C_SURFACE_VARIANT_L_HEX="#F2DFD1"
            C_SURFACE_VARIANT_D="red: 0.318, green: 0.271, blue: 0.227, alpha: 1"
            C_SURFACE_VARIANT_D_HEX="#51453A"
            C_ON_SURFACE_VARIANT_L="red: 0.318, green: 0.271, blue: 0.227, alpha: 1"
            C_ON_SURFACE_VARIANT_L_HEX="#51453A"
            C_ON_SURFACE_VARIANT_D="red: 0.835, green: 0.765, blue: 0.710, alpha: 1"
            C_ON_SURFACE_VARIANT_D_HEX="#D5C3B5"
            C_OUTLINE_L="red: 0.514, green: 0.455, blue: 0.408, alpha: 1"
            C_OUTLINE_L_HEX="#837468"
            C_OUTLINE_D="red: 0.620, green: 0.557, blue: 0.506, alpha: 1"
            C_OUTLINE_D_HEX="#9E8E81"
            C_OUTLINE_VARIANT_L="red: 0.835, green: 0.765, blue: 0.710, alpha: 1"
            C_OUTLINE_VARIANT_L_HEX="#D5C3B5"
            C_OUTLINE_VARIANT_D="red: 0.318, green: 0.271, blue: 0.227, alpha: 1"
            C_OUTLINE_VARIANT_D_HEX="#51453A"
            C_BACKGROUND_L="red: 1.000, green: 0.984, blue: 1.000, alpha: 1"
            C_BACKGROUND_L_HEX="#FFFBFF"
            C_BACKGROUND_D="red: 0.125, green: 0.106, blue: 0.086, alpha: 1"
            C_BACKGROUND_D_HEX="#201B16"
            C_ON_BACKGROUND_L="red: 0.125, green: 0.106, blue: 0.086, alpha: 1"
            C_ON_BACKGROUND_L_HEX="#201B16"
            C_ON_BACKGROUND_D="red: 0.922, green: 0.878, blue: 0.851, alpha: 1"
            C_ON_BACKGROUND_D_HEX="#EBE0D9"
            C_INVERSE_SURFACE_L="red: 0.208, green: 0.184, blue: 0.169, alpha: 1"
            C_INVERSE_SURFACE_L_HEX="#352F2B"
            C_INVERSE_SURFACE_D="red: 0.922, green: 0.878, blue: 0.851, alpha: 1"
            C_INVERSE_SURFACE_D_HEX="#EBE0D9"
            C_INVERSE_ON_SURFACE_L="red: 0.980, green: 0.937, blue: 0.906, alpha: 1"
            C_INVERSE_ON_SURFACE_L_HEX="#FAEFE7"
            C_INVERSE_ON_SURFACE_D="red: 0.208, green: 0.184, blue: 0.169, alpha: 1"
            C_INVERSE_ON_SURFACE_D_HEX="#352F2B"
            C_INVERSE_PRIMARY_L="red: 1.000, green: 0.722, blue: 0.443, alpha: 1"
            C_INVERSE_PRIMARY_L_HEX="#FFB871"
            C_INVERSE_PRIMARY_D="red: 0.545, green: 0.314, blue: 0.000, alpha: 1"
            C_INVERSE_PRIMARY_D_HEX="#8B5000"
            C_SURFACE_DIM_L="red: 0.890, green: 0.847, blue: 0.820, alpha: 1"
            C_SURFACE_DIM_L_HEX="#E3D8D1"
            C_SURFACE_DIM_D="red: 0.090, green: 0.071, blue: 0.059, alpha: 1"
            C_SURFACE_DIM_D_HEX="#17120F"
            C_SURFACE_BRIGHT_L="red: 1.000, green: 0.973, blue: 0.961, alpha: 1"
            C_SURFACE_BRIGHT_L_HEX="#FFF8F5"
            C_SURFACE_BRIGHT_D="red: 0.243, green: 0.220, blue: 0.200, alpha: 1"
            C_SURFACE_BRIGHT_D_HEX="#3E3833"
            C_SURFACE_CONTAINER_L="red: 0.969, green: 0.925, blue: 0.898, alpha: 1"
            C_SURFACE_CONTAINER_L_HEX="#F7ECE5"
            C_SURFACE_CONTAINER_D="red: 0.141, green: 0.122, blue: 0.102, alpha: 1"
            C_SURFACE_CONTAINER_D_HEX="#241F1A"
            C_SURFACE_CONTAINER_LOW_L="red: 0.992, green: 0.945, blue: 0.918, alpha: 1"
            C_SURFACE_CONTAINER_LOW_L_HEX="#FDF1EA"
            C_SURFACE_CONTAINER_LOW_D="red: 0.125, green: 0.106, blue: 0.086, alpha: 1"
            C_SURFACE_CONTAINER_LOW_D_HEX="#201B16"
            C_SURFACE_CONTAINER_HIGH_L="red: 0.945, green: 0.902, blue: 0.875, alpha: 1"
            C_SURFACE_CONTAINER_HIGH_L_HEX="#F1E6DF"
            C_SURFACE_CONTAINER_HIGH_D="red: 0.180, green: 0.161, blue: 0.141, alpha: 1"
            C_SURFACE_CONTAINER_HIGH_D_HEX="#2E2924"
            C_SCRIM_L="red: 0.000, green: 0.000, blue: 0.000, alpha: 1"
            C_SCRIM_L_HEX="#000000"
            C_SCRIM_D="red: 0.000, green: 0.000, blue: 0.000, alpha: 1"
            C_SCRIM_D_HEX="#000000"
            ;;
        teal)
            C_PRIMARY_L="red: 0.000, green: 0.416, blue: 0.416, alpha: 1"
            C_PRIMARY_L_HEX="#006A6A"
            C_PRIMARY_D="red: 0.298, green: 0.855, blue: 0.855, alpha: 1"
            C_PRIMARY_D_HEX="#4CDADA"
            C_ON_PRIMARY_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_PRIMARY_L_HEX="#FFFFFF"
            C_ON_PRIMARY_D="red: 0.000, green: 0.216, blue: 0.216, alpha: 1"
            C_ON_PRIMARY_D_HEX="#003737"
            C_PRIMARY_CONTAINER_L="red: 0.435, green: 0.969, blue: 0.965, alpha: 1"
            C_PRIMARY_CONTAINER_L_HEX="#6FF7F6"
            C_PRIMARY_CONTAINER_D="red: 0.000, green: 0.310, blue: 0.310, alpha: 1"
            C_PRIMARY_CONTAINER_D_HEX="#004F4F"
            C_ON_PRIMARY_CONTAINER_L="red: 0.000, green: 0.125, blue: 0.125, alpha: 1"
            C_ON_PRIMARY_CONTAINER_L_HEX="#002020"
            C_ON_PRIMARY_CONTAINER_D="red: 0.435, green: 0.969, blue: 0.965, alpha: 1"
            C_ON_PRIMARY_CONTAINER_D_HEX="#6FF7F6"
            C_SECONDARY_L="red: 0.290, green: 0.388, blue: 0.388, alpha: 1"
            C_SECONDARY_L_HEX="#4A6363"
            C_SECONDARY_D="red: 0.690, green: 0.800, blue: 0.796, alpha: 1"
            C_SECONDARY_D_HEX="#B0CCCB"
            C_ON_SECONDARY_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_SECONDARY_L_HEX="#FFFFFF"
            C_ON_SECONDARY_D="red: 0.106, green: 0.208, blue: 0.204, alpha: 1"
            C_ON_SECONDARY_D_HEX="#1B3534"
            C_SECONDARY_CONTAINER_L="red: 0.800, green: 0.910, blue: 0.906, alpha: 1"
            C_SECONDARY_CONTAINER_L_HEX="#CCE8E7"
            C_SECONDARY_CONTAINER_D="red: 0.196, green: 0.294, blue: 0.294, alpha: 1"
            C_SECONDARY_CONTAINER_D_HEX="#324B4B"
            C_ON_SECONDARY_CONTAINER_L="red: 0.020, green: 0.122, blue: 0.122, alpha: 1"
            C_ON_SECONDARY_CONTAINER_L_HEX="#051F1F"
            C_ON_SECONDARY_CONTAINER_D="red: 0.800, green: 0.910, blue: 0.906, alpha: 1"
            C_ON_SECONDARY_CONTAINER_D_HEX="#CCE8E7"
            C_TERTIARY_L="red: 0.294, green: 0.376, blue: 0.486, alpha: 1"
            C_TERTIARY_L_HEX="#4B607C"
            C_TERTIARY_D="red: 0.702, green: 0.784, blue: 0.910, alpha: 1"
            C_TERTIARY_D_HEX="#B3C8E8"
            C_ON_TERTIARY_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_TERTIARY_L_HEX="#FFFFFF"
            C_ON_TERTIARY_D="red: 0.110, green: 0.192, blue: 0.294, alpha: 1"
            C_ON_TERTIARY_D_HEX="#1C314B"
            C_TERTIARY_CONTAINER_L="red: 0.827, green: 0.894, blue: 1.000, alpha: 1"
            C_TERTIARY_CONTAINER_L_HEX="#D3E4FF"
            C_TERTIARY_CONTAINER_D="red: 0.200, green: 0.282, blue: 0.388, alpha: 1"
            C_TERTIARY_CONTAINER_D_HEX="#334863"
            C_ON_TERTIARY_CONTAINER_L="red: 0.016, green: 0.110, blue: 0.208, alpha: 1"
            C_ON_TERTIARY_CONTAINER_L_HEX="#041C35"
            C_ON_TERTIARY_CONTAINER_D="red: 0.827, green: 0.894, blue: 1.000, alpha: 1"
            C_ON_TERTIARY_CONTAINER_D_HEX="#D3E4FF"
            C_ERROR_L="red: 0.729, green: 0.102, blue: 0.102, alpha: 1"
            C_ERROR_L_HEX="#BA1A1A"
            C_ERROR_D="red: 1.000, green: 0.706, blue: 0.671, alpha: 1"
            C_ERROR_D_HEX="#FFB4AB"
            C_ON_ERROR_L="red: 1.000, green: 1.000, blue: 1.000, alpha: 1"
            C_ON_ERROR_L_HEX="#FFFFFF"
            C_ON_ERROR_D="red: 0.412, green: 0.000, blue: 0.020, alpha: 1"
            C_ON_ERROR_D_HEX="#690005"
            C_ERROR_CONTAINER_L="red: 1.000, green: 0.855, blue: 0.839, alpha: 1"
            C_ERROR_CONTAINER_L_HEX="#FFDAD6"
            C_ERROR_CONTAINER_D="red: 0.576, green: 0.000, blue: 0.039, alpha: 1"
            C_ERROR_CONTAINER_D_HEX="#93000A"
            C_ON_ERROR_CONTAINER_L="red: 0.255, green: 0.000, blue: 0.008, alpha: 1"
            C_ON_ERROR_CONTAINER_L_HEX="#410002"
            C_ON_ERROR_CONTAINER_D="red: 1.000, green: 0.706, blue: 0.671, alpha: 1"
            C_ON_ERROR_CONTAINER_D_HEX="#FFB4AB"
            C_SURFACE_L="red: 0.980, green: 0.992, blue: 0.988, alpha: 1"
            C_SURFACE_L_HEX="#FAFDFC"
            C_SURFACE_D="red: 0.098, green: 0.110, blue: 0.110, alpha: 1"
            C_SURFACE_D_HEX="#191C1C"
            C_ON_SURFACE_L="red: 0.098, green: 0.110, blue: 0.110, alpha: 1"
            C_ON_SURFACE_L_HEX="#191C1C"
            C_ON_SURFACE_D="red: 0.878, green: 0.890, blue: 0.886, alpha: 1"
            C_ON_SURFACE_D_HEX="#E0E3E2"
            C_SURFACE_VARIANT_L="red: 0.855, green: 0.898, blue: 0.894, alpha: 1"
            C_SURFACE_VARIANT_L_HEX="#DAE5E4"
            C_SURFACE_VARIANT_D="red: 0.247, green: 0.286, blue: 0.282, alpha: 1"
            C_SURFACE_VARIANT_D_HEX="#3F4948"
            C_ON_SURFACE_VARIANT_L="red: 0.247, green: 0.286, blue: 0.282, alpha: 1"
            C_ON_SURFACE_VARIANT_L_HEX="#3F4948"
            C_ON_SURFACE_VARIANT_D="red: 0.745, green: 0.788, blue: 0.784, alpha: 1"
            C_ON_SURFACE_VARIANT_D_HEX="#BEC9C8"
            C_OUTLINE_L="red: 0.435, green: 0.475, blue: 0.475, alpha: 1"
            C_OUTLINE_L_HEX="#6F7979"
            C_OUTLINE_D="red: 0.533, green: 0.576, blue: 0.573, alpha: 1"
            C_OUTLINE_D_HEX="#889392"
            C_OUTLINE_VARIANT_L="red: 0.745, green: 0.788, blue: 0.784, alpha: 1"
            C_OUTLINE_VARIANT_L_HEX="#BEC9C8"
            C_OUTLINE_VARIANT_D="red: 0.247, green: 0.286, blue: 0.282, alpha: 1"
            C_OUTLINE_VARIANT_D_HEX="#3F4948"
            C_BACKGROUND_L="red: 0.980, green: 0.992, blue: 0.988, alpha: 1"
            C_BACKGROUND_L_HEX="#FAFDFC"
            C_BACKGROUND_D="red: 0.098, green: 0.110, blue: 0.110, alpha: 1"
            C_BACKGROUND_D_HEX="#191C1C"
            C_ON_BACKGROUND_L="red: 0.098, green: 0.110, blue: 0.110, alpha: 1"
            C_ON_BACKGROUND_L_HEX="#191C1C"
            C_ON_BACKGROUND_D="red: 0.878, green: 0.890, blue: 0.886, alpha: 1"
            C_ON_BACKGROUND_D_HEX="#E0E3E2"
            C_INVERSE_SURFACE_L="red: 0.176, green: 0.192, blue: 0.192, alpha: 1"
            C_INVERSE_SURFACE_L_HEX="#2D3131"
            C_INVERSE_SURFACE_D="red: 0.878, green: 0.890, blue: 0.886, alpha: 1"
            C_INVERSE_SURFACE_D_HEX="#E0E3E2"
            C_INVERSE_ON_SURFACE_L="red: 0.937, green: 0.945, blue: 0.941, alpha: 1"
            C_INVERSE_ON_SURFACE_L_HEX="#EFF1F0"
            C_INVERSE_ON_SURFACE_D="red: 0.176, green: 0.192, blue: 0.192, alpha: 1"
            C_INVERSE_ON_SURFACE_D_HEX="#2D3131"
            C_INVERSE_PRIMARY_L="red: 0.298, green: 0.855, blue: 0.855, alpha: 1"
            C_INVERSE_PRIMARY_L_HEX="#4CDADA"
            C_INVERSE_PRIMARY_D="red: 0.000, green: 0.416, blue: 0.416, alpha: 1"
            C_INVERSE_PRIMARY_D_HEX="#006A6A"
            C_SURFACE_DIM_L="red: 0.847, green: 0.855, blue: 0.855, alpha: 1"
            C_SURFACE_DIM_L_HEX="#D8DADA"
            C_SURFACE_DIM_D="red: 0.063, green: 0.078, blue: 0.078, alpha: 1"
            C_SURFACE_DIM_D_HEX="#101414"
            C_SURFACE_BRIGHT_L="red: 0.969, green: 0.980, blue: 0.976, alpha: 1"
            C_SURFACE_BRIGHT_L_HEX="#F7FAF9"
            C_SURFACE_BRIGHT_D="red: 0.212, green: 0.227, blue: 0.227, alpha: 1"
            C_SURFACE_BRIGHT_D_HEX="#363A3A"
            C_SURFACE_CONTAINER_L="red: 0.925, green: 0.933, blue: 0.929, alpha: 1"
            C_SURFACE_CONTAINER_L_HEX="#ECEEED"
            C_SURFACE_CONTAINER_D="red: 0.114, green: 0.125, blue: 0.125, alpha: 1"
            C_SURFACE_CONTAINER_D_HEX="#1D2020"
            C_SURFACE_CONTAINER_LOW_L="red: 0.949, green: 0.957, blue: 0.953, alpha: 1"
            C_SURFACE_CONTAINER_LOW_L_HEX="#F2F4F3"
            C_SURFACE_CONTAINER_LOW_D="red: 0.098, green: 0.110, blue: 0.110, alpha: 1"
            C_SURFACE_CONTAINER_LOW_D_HEX="#191C1C"
            C_SURFACE_CONTAINER_HIGH_L="red: 0.902, green: 0.914, blue: 0.910, alpha: 1"
            C_SURFACE_CONTAINER_HIGH_L_HEX="#E6E9E8"
            C_SURFACE_CONTAINER_HIGH_D="red: 0.153, green: 0.169, blue: 0.165, alpha: 1"
            C_SURFACE_CONTAINER_HIGH_D_HEX="#272B2A"
            C_SCRIM_L="red: 0.000, green: 0.000, blue: 0.000, alpha: 1"
            C_SCRIM_L_HEX="#000000"
            C_SCRIM_D="red: 0.000, green: 0.000, blue: 0.000, alpha: 1"
            C_SCRIM_D_HEX="#000000"
            ;;
        custom)
            # Generate palette from custom hex using bundled M3 engine (JavaScriptCore)
            local engine_path
            engine_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../m3_engine.js"
            local js_output
            js_output=$(osascript -l JavaScript "$engine_path" "#${PRIMARY_COLOR_HEX}" 2>&1)
            if [ $? -ne 0 ]; then
                print_error "Failed to generate color palette from #${PRIMARY_COLOR_HEX}"
                print_error "$js_output"
                exit 1
            fi
            eval "$js_output"
            ;;
    esac
}

# ─── ThemeColors.swift ────────────────────────────────────────────────────────

generate_theme_colors() {
    local base_dir="$1"

    _set_theme_palette "$PRIMARY_COLOR"

    local theme_label="${PRIMARY_COLOR}"
    if [[ "$PRIMARY_COLOR" == "custom" ]]; then
        theme_label="custom (#${PRIMARY_COLOR_HEX})"
    fi

    cat <<EOF > "${base_dir}/Sources/Resources/ThemeColors.swift"
import UIKit

/// Material Design 3 color tokens with automatic light/dark mode support.
/// Theme: ${theme_label} — Reference: https://m3.material.io/styles/color/roles
public enum ThemeColors {

    // MARK: - Primary

    public static let primary = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_PRIMARY_D}) // ${C_PRIMARY_D_HEX}
            : UIColor(${C_PRIMARY_L}) // ${C_PRIMARY_L_HEX}
    }

    public static let onPrimary = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_ON_PRIMARY_D}) // ${C_ON_PRIMARY_D_HEX}
            : UIColor(${C_ON_PRIMARY_L}) // ${C_ON_PRIMARY_L_HEX}
    }

    public static let primaryContainer = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_PRIMARY_CONTAINER_D}) // ${C_PRIMARY_CONTAINER_D_HEX}
            : UIColor(${C_PRIMARY_CONTAINER_L}) // ${C_PRIMARY_CONTAINER_L_HEX}
    }

    public static let onPrimaryContainer = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_ON_PRIMARY_CONTAINER_D}) // ${C_ON_PRIMARY_CONTAINER_D_HEX}
            : UIColor(${C_ON_PRIMARY_CONTAINER_L}) // ${C_ON_PRIMARY_CONTAINER_L_HEX}
    }

    // MARK: - Secondary

    public static let secondary = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_SECONDARY_D}) // ${C_SECONDARY_D_HEX}
            : UIColor(${C_SECONDARY_L}) // ${C_SECONDARY_L_HEX}
    }

    public static let onSecondary = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_ON_SECONDARY_D}) // ${C_ON_SECONDARY_D_HEX}
            : UIColor(${C_ON_SECONDARY_L}) // ${C_ON_SECONDARY_L_HEX}
    }

    public static let secondaryContainer = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_SECONDARY_CONTAINER_D}) // ${C_SECONDARY_CONTAINER_D_HEX}
            : UIColor(${C_SECONDARY_CONTAINER_L}) // ${C_SECONDARY_CONTAINER_L_HEX}
    }

    public static let onSecondaryContainer = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_ON_SECONDARY_CONTAINER_D}) // ${C_ON_SECONDARY_CONTAINER_D_HEX}
            : UIColor(${C_ON_SECONDARY_CONTAINER_L}) // ${C_ON_SECONDARY_CONTAINER_L_HEX}
    }

    // MARK: - Tertiary

    public static let tertiary = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_TERTIARY_D}) // ${C_TERTIARY_D_HEX}
            : UIColor(${C_TERTIARY_L}) // ${C_TERTIARY_L_HEX}
    }

    public static let onTertiary = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_ON_TERTIARY_D}) // ${C_ON_TERTIARY_D_HEX}
            : UIColor(${C_ON_TERTIARY_L}) // ${C_ON_TERTIARY_L_HEX}
    }

    public static let tertiaryContainer = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_TERTIARY_CONTAINER_D}) // ${C_TERTIARY_CONTAINER_D_HEX}
            : UIColor(${C_TERTIARY_CONTAINER_L}) // ${C_TERTIARY_CONTAINER_L_HEX}
    }

    public static let onTertiaryContainer = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_ON_TERTIARY_CONTAINER_D}) // ${C_ON_TERTIARY_CONTAINER_D_HEX}
            : UIColor(${C_ON_TERTIARY_CONTAINER_L}) // ${C_ON_TERTIARY_CONTAINER_L_HEX}
    }

    // MARK: - Error

    public static let error = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_ERROR_D}) // ${C_ERROR_D_HEX}
            : UIColor(${C_ERROR_L}) // ${C_ERROR_L_HEX}
    }

    public static let onError = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_ON_ERROR_D}) // ${C_ON_ERROR_D_HEX}
            : UIColor(${C_ON_ERROR_L}) // ${C_ON_ERROR_L_HEX}
    }

    public static let errorContainer = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_ERROR_CONTAINER_D}) // ${C_ERROR_CONTAINER_D_HEX}
            : UIColor(${C_ERROR_CONTAINER_L}) // ${C_ERROR_CONTAINER_L_HEX}
    }

    public static let onErrorContainer = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_ON_ERROR_CONTAINER_D}) // ${C_ON_ERROR_CONTAINER_D_HEX}
            : UIColor(${C_ON_ERROR_CONTAINER_L}) // ${C_ON_ERROR_CONTAINER_L_HEX}
    }

    // MARK: - Surface

    public static let surface = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_SURFACE_D}) // ${C_SURFACE_D_HEX}
            : UIColor(${C_SURFACE_L}) // ${C_SURFACE_L_HEX}
    }

    public static let onSurface = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_ON_SURFACE_D}) // ${C_ON_SURFACE_D_HEX}
            : UIColor(${C_ON_SURFACE_L}) // ${C_ON_SURFACE_L_HEX}
    }

    public static let surfaceVariant = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_SURFACE_VARIANT_D}) // ${C_SURFACE_VARIANT_D_HEX}
            : UIColor(${C_SURFACE_VARIANT_L}) // ${C_SURFACE_VARIANT_L_HEX}
    }

    public static let onSurfaceVariant = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_ON_SURFACE_VARIANT_D}) // ${C_ON_SURFACE_VARIANT_D_HEX}
            : UIColor(${C_ON_SURFACE_VARIANT_L}) // ${C_ON_SURFACE_VARIANT_L_HEX}
    }

    public static let surfaceDim = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_SURFACE_DIM_D}) // ${C_SURFACE_DIM_D_HEX}
            : UIColor(${C_SURFACE_DIM_L}) // ${C_SURFACE_DIM_L_HEX}
    }

    public static let surfaceBright = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_SURFACE_BRIGHT_D}) // ${C_SURFACE_BRIGHT_D_HEX}
            : UIColor(${C_SURFACE_BRIGHT_L}) // ${C_SURFACE_BRIGHT_L_HEX}
    }

    public static let surfaceContainer = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_SURFACE_CONTAINER_D}) // ${C_SURFACE_CONTAINER_D_HEX}
            : UIColor(${C_SURFACE_CONTAINER_L}) // ${C_SURFACE_CONTAINER_L_HEX}
    }

    public static let surfaceContainerLow = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_SURFACE_CONTAINER_LOW_D}) // ${C_SURFACE_CONTAINER_LOW_D_HEX}
            : UIColor(${C_SURFACE_CONTAINER_LOW_L}) // ${C_SURFACE_CONTAINER_LOW_L_HEX}
    }

    public static let surfaceContainerHigh = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_SURFACE_CONTAINER_HIGH_D}) // ${C_SURFACE_CONTAINER_HIGH_D_HEX}
            : UIColor(${C_SURFACE_CONTAINER_HIGH_L}) // ${C_SURFACE_CONTAINER_HIGH_L_HEX}
    }

    // MARK: - Background

    public static let background = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_BACKGROUND_D}) // ${C_BACKGROUND_D_HEX}
            : UIColor(${C_BACKGROUND_L}) // ${C_BACKGROUND_L_HEX}
    }

    public static let onBackground = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_ON_BACKGROUND_D}) // ${C_ON_BACKGROUND_D_HEX}
            : UIColor(${C_ON_BACKGROUND_L}) // ${C_ON_BACKGROUND_L_HEX}
    }

    // MARK: - Outline

    public static let outline = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_OUTLINE_D}) // ${C_OUTLINE_D_HEX}
            : UIColor(${C_OUTLINE_L}) // ${C_OUTLINE_L_HEX}
    }

    public static let outlineVariant = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_OUTLINE_VARIANT_D}) // ${C_OUTLINE_VARIANT_D_HEX}
            : UIColor(${C_OUTLINE_VARIANT_L}) // ${C_OUTLINE_VARIANT_L_HEX}
    }

    // MARK: - Inverse

    public static let inverseSurface = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_INVERSE_SURFACE_D}) // ${C_INVERSE_SURFACE_D_HEX}
            : UIColor(${C_INVERSE_SURFACE_L}) // ${C_INVERSE_SURFACE_L_HEX}
    }

    public static let inverseOnSurface = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_INVERSE_ON_SURFACE_D}) // ${C_INVERSE_ON_SURFACE_D_HEX}
            : UIColor(${C_INVERSE_ON_SURFACE_L}) // ${C_INVERSE_ON_SURFACE_L_HEX}
    }

    public static let inversePrimary = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(${C_INVERSE_PRIMARY_D}) // ${C_INVERSE_PRIMARY_D_HEX}
            : UIColor(${C_INVERSE_PRIMARY_L}) // ${C_INVERSE_PRIMARY_L_HEX}
    }

    // MARK: - Scrim

    public static let scrim = UIColor(${C_SCRIM_L}) // ${C_SCRIM_L_HEX}
}
EOF
}

# ─── Color+ThemeColors.swift ──────────────────────────────────────────────────

generate_color_extensions() {
    local base_dir="$1"

    cat <<'EOF' > "${base_dir}/Sources/Resources/Color+ThemeColors.swift"
import SwiftUI

/// SwiftUI wrappers for Material Design 3 color tokens.
/// Usage: `Color.Theme.primary`, `Color.Theme.onSurface`, etc.
extension Color {
    enum Theme {
        // MARK: - Primary
        static let primary = Color(uiColor: ThemeColors.primary)
        static let onPrimary = Color(uiColor: ThemeColors.onPrimary)
        static let primaryContainer = Color(uiColor: ThemeColors.primaryContainer)
        static let onPrimaryContainer = Color(uiColor: ThemeColors.onPrimaryContainer)

        // MARK: - Secondary
        static let secondary = Color(uiColor: ThemeColors.secondary)
        static let onSecondary = Color(uiColor: ThemeColors.onSecondary)
        static let secondaryContainer = Color(uiColor: ThemeColors.secondaryContainer)
        static let onSecondaryContainer = Color(uiColor: ThemeColors.onSecondaryContainer)

        // MARK: - Tertiary
        static let tertiary = Color(uiColor: ThemeColors.tertiary)
        static let onTertiary = Color(uiColor: ThemeColors.onTertiary)
        static let tertiaryContainer = Color(uiColor: ThemeColors.tertiaryContainer)
        static let onTertiaryContainer = Color(uiColor: ThemeColors.onTertiaryContainer)

        // MARK: - Error
        static let error = Color(uiColor: ThemeColors.error)
        static let onError = Color(uiColor: ThemeColors.onError)
        static let errorContainer = Color(uiColor: ThemeColors.errorContainer)
        static let onErrorContainer = Color(uiColor: ThemeColors.onErrorContainer)

        // MARK: - Surface
        static let surface = Color(uiColor: ThemeColors.surface)
        static let onSurface = Color(uiColor: ThemeColors.onSurface)
        static let surfaceVariant = Color(uiColor: ThemeColors.surfaceVariant)
        static let onSurfaceVariant = Color(uiColor: ThemeColors.onSurfaceVariant)
        static let surfaceDim = Color(uiColor: ThemeColors.surfaceDim)
        static let surfaceBright = Color(uiColor: ThemeColors.surfaceBright)
        static let surfaceContainer = Color(uiColor: ThemeColors.surfaceContainer)
        static let surfaceContainerLow = Color(uiColor: ThemeColors.surfaceContainerLow)
        static let surfaceContainerHigh = Color(uiColor: ThemeColors.surfaceContainerHigh)

        // MARK: - Background
        static let background = Color(uiColor: ThemeColors.background)
        static let onBackground = Color(uiColor: ThemeColors.onBackground)

        // MARK: - Outline
        static let outline = Color(uiColor: ThemeColors.outline)
        static let outlineVariant = Color(uiColor: ThemeColors.outlineVariant)

        // MARK: - Inverse
        static let inverseSurface = Color(uiColor: ThemeColors.inverseSurface)
        static let inverseOnSurface = Color(uiColor: ThemeColors.inverseOnSurface)
        static let inversePrimary = Color(uiColor: ThemeColors.inversePrimary)

        // MARK: - Scrim
        static let scrim = Color(uiColor: ThemeColors.scrim)
    }
}
EOF
}
