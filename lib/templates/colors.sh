#!/bin/bash
# ─── Material Design 3 Colors ────────────────────────────────────────────────

generate_material_colors() {
    local base_dir="$1"

    cat <<'EOF' > "${base_dir}/Sources/Resources/MaterialColors.swift"
import UIKit

/// Material Design 3 baseline color tokens with automatic light/dark mode support.
/// Reference: https://m3.material.io/styles/color/roles
public enum MaterialColors {

    // MARK: - Primary

    public static let primary = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.816, green: 0.737, blue: 1.000, alpha: 1) // #D0BCFF
            : UIColor(red: 0.404, green: 0.314, blue: 0.643, alpha: 1) // #6750A4
    }

    public static let onPrimary = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.220, green: 0.118, blue: 0.447, alpha: 1) // #381E72
            : UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1) // #FFFFFF
    }

    public static let primaryContainer = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.310, green: 0.216, blue: 0.545, alpha: 1) // #4F378B
            : UIColor(red: 0.918, green: 0.867, blue: 1.000, alpha: 1) // #EADDFF
    }

    public static let onPrimaryContainer = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.918, green: 0.867, blue: 1.000, alpha: 1) // #EADDFF
            : UIColor(red: 0.129, green: 0.000, blue: 0.365, alpha: 1) // #21005D
    }

    // MARK: - Secondary

    public static let secondary = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.800, green: 0.761, blue: 0.863, alpha: 1) // #CCC2DC
            : UIColor(red: 0.384, green: 0.357, blue: 0.443, alpha: 1) // #625B71
    }

    public static let onSecondary = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.200, green: 0.176, blue: 0.255, alpha: 1) // #332D41
            : UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1) // #FFFFFF
    }

    public static let secondaryContainer = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.290, green: 0.267, blue: 0.345, alpha: 1) // #4A4458
            : UIColor(red: 0.910, green: 0.871, blue: 0.973, alpha: 1) // #E8DEF8
    }

    public static let onSecondaryContainer = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.910, green: 0.871, blue: 0.973, alpha: 1) // #E8DEF8
            : UIColor(red: 0.114, green: 0.098, blue: 0.169, alpha: 1) // #1D192B
    }

    // MARK: - Tertiary

    public static let tertiary = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.937, green: 0.722, blue: 0.784, alpha: 1) // #EFB8C8
            : UIColor(red: 0.490, green: 0.322, blue: 0.376, alpha: 1) // #7D5260
    }

    public static let onTertiary = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.286, green: 0.145, blue: 0.196, alpha: 1) // #492532
            : UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1) // #FFFFFF
    }

    public static let tertiaryContainer = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.388, green: 0.231, blue: 0.282, alpha: 1) // #633B48
            : UIColor(red: 1.000, green: 0.847, blue: 0.894, alpha: 1) // #FFD8E4
    }

    public static let onTertiaryContainer = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 1.000, green: 0.847, blue: 0.894, alpha: 1) // #FFD8E4
            : UIColor(red: 0.192, green: 0.067, blue: 0.114, alpha: 1) // #31111D
    }

    // MARK: - Error

    public static let error = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.949, green: 0.722, blue: 0.710, alpha: 1) // #F2B8B5
            : UIColor(red: 0.702, green: 0.149, blue: 0.118, alpha: 1) // #B3261E
    }

    public static let onError = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.376, green: 0.078, blue: 0.063, alpha: 1) // #601410
            : UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1) // #FFFFFF
    }

    public static let errorContainer = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.549, green: 0.114, blue: 0.094, alpha: 1) // #8C1D18
            : UIColor(red: 0.976, green: 0.871, blue: 0.863, alpha: 1) // #F9DEDC
    }

    public static let onErrorContainer = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.976, green: 0.871, blue: 0.863, alpha: 1) // #F9DEDC
            : UIColor(red: 0.255, green: 0.055, blue: 0.043, alpha: 1) // #410E0B
    }

    // MARK: - Surface

    public static let surface = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.078, green: 0.071, blue: 0.094, alpha: 1) // #141218
            : UIColor(red: 0.996, green: 0.969, blue: 1.000, alpha: 1) // #FEF7FF
    }

    public static let onSurface = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.902, green: 0.878, blue: 0.914, alpha: 1) // #E6E0E9
            : UIColor(red: 0.114, green: 0.106, blue: 0.125, alpha: 1) // #1D1B20
    }

    public static let surfaceVariant = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.286, green: 0.271, blue: 0.310, alpha: 1) // #49454F
            : UIColor(red: 0.906, green: 0.878, blue: 0.925, alpha: 1) // #E7E0EC
    }

    public static let onSurfaceVariant = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.792, green: 0.769, blue: 0.816, alpha: 1) // #CAC4D0
            : UIColor(red: 0.286, green: 0.271, blue: 0.310, alpha: 1) // #49454F
    }

    public static let surfaceDim = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.078, green: 0.071, blue: 0.094, alpha: 1) // #141218
            : UIColor(red: 0.871, green: 0.847, blue: 0.882, alpha: 1) // #DED8E1
    }

    public static let surfaceBright = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.231, green: 0.220, blue: 0.243, alpha: 1) // #3B383E
            : UIColor(red: 0.996, green: 0.969, blue: 1.000, alpha: 1) // #FEF7FF
    }

    public static let surfaceContainer = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.129, green: 0.122, blue: 0.149, alpha: 1) // #211F26
            : UIColor(red: 0.953, green: 0.929, blue: 0.969, alpha: 1) // #F3EDF7
    }

    public static let surfaceContainerLow = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.114, green: 0.106, blue: 0.125, alpha: 1) // #1D1B20
            : UIColor(red: 0.969, green: 0.949, blue: 0.980, alpha: 1) // #F7F2FA
    }

    public static let surfaceContainerHigh = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.169, green: 0.161, blue: 0.188, alpha: 1) // #2B2930
            : UIColor(red: 0.925, green: 0.902, blue: 0.941, alpha: 1) // #ECE6F0
    }

    // MARK: - Background

    public static let background = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.078, green: 0.071, blue: 0.094, alpha: 1) // #141218
            : UIColor(red: 0.996, green: 0.969, blue: 1.000, alpha: 1) // #FEF7FF
    }

    public static let onBackground = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.902, green: 0.878, blue: 0.914, alpha: 1) // #E6E0E9
            : UIColor(red: 0.114, green: 0.106, blue: 0.125, alpha: 1) // #1D1B20
    }

    // MARK: - Outline

    public static let outline = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.576, green: 0.561, blue: 0.600, alpha: 1) // #938F99
            : UIColor(red: 0.475, green: 0.455, blue: 0.494, alpha: 1) // #79747E
    }

    public static let outlineVariant = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.286, green: 0.271, blue: 0.310, alpha: 1) // #49454F
            : UIColor(red: 0.792, green: 0.769, blue: 0.816, alpha: 1) // #CAC4D0
    }

    // MARK: - Inverse

    public static let inverseSurface = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.902, green: 0.878, blue: 0.914, alpha: 1) // #E6E0E9
            : UIColor(red: 0.196, green: 0.184, blue: 0.208, alpha: 1) // #322F35
    }

    public static let inverseOnSurface = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.196, green: 0.184, blue: 0.208, alpha: 1) // #322F35
            : UIColor(red: 0.961, green: 0.937, blue: 0.969, alpha: 1) // #F5EFF7
    }

    public static let inversePrimary = UIColor { traits in
        traits.userInterfaceStyle == .dark
            ? UIColor(red: 0.404, green: 0.314, blue: 0.643, alpha: 1) // #6750A4
            : UIColor(red: 0.816, green: 0.737, blue: 1.000, alpha: 1) // #D0BCFF
    }

    // MARK: - Scrim

    public static let scrim = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1) // #000000
}
EOF
}

generate_color_extensions() {
    local base_dir="$1"

    cat <<'EOF' > "${base_dir}/Sources/Resources/Color+MaterialColors.swift"
import SwiftUI

/// SwiftUI wrappers for Material Design 3 color tokens.
/// Usage: `Color.Material.primary`, `Color.Material.onSurface`, etc.
extension Color {
    enum Material {
        // MARK: - Primary
        static let primary = Color(uiColor: MaterialColors.primary)
        static let onPrimary = Color(uiColor: MaterialColors.onPrimary)
        static let primaryContainer = Color(uiColor: MaterialColors.primaryContainer)
        static let onPrimaryContainer = Color(uiColor: MaterialColors.onPrimaryContainer)

        // MARK: - Secondary
        static let secondary = Color(uiColor: MaterialColors.secondary)
        static let onSecondary = Color(uiColor: MaterialColors.onSecondary)
        static let secondaryContainer = Color(uiColor: MaterialColors.secondaryContainer)
        static let onSecondaryContainer = Color(uiColor: MaterialColors.onSecondaryContainer)

        // MARK: - Tertiary
        static let tertiary = Color(uiColor: MaterialColors.tertiary)
        static let onTertiary = Color(uiColor: MaterialColors.onTertiary)
        static let tertiaryContainer = Color(uiColor: MaterialColors.tertiaryContainer)
        static let onTertiaryContainer = Color(uiColor: MaterialColors.onTertiaryContainer)

        // MARK: - Error
        static let error = Color(uiColor: MaterialColors.error)
        static let onError = Color(uiColor: MaterialColors.onError)
        static let errorContainer = Color(uiColor: MaterialColors.errorContainer)
        static let onErrorContainer = Color(uiColor: MaterialColors.onErrorContainer)

        // MARK: - Surface
        static let surface = Color(uiColor: MaterialColors.surface)
        static let onSurface = Color(uiColor: MaterialColors.onSurface)
        static let surfaceVariant = Color(uiColor: MaterialColors.surfaceVariant)
        static let onSurfaceVariant = Color(uiColor: MaterialColors.onSurfaceVariant)
        static let surfaceDim = Color(uiColor: MaterialColors.surfaceDim)
        static let surfaceBright = Color(uiColor: MaterialColors.surfaceBright)
        static let surfaceContainer = Color(uiColor: MaterialColors.surfaceContainer)
        static let surfaceContainerLow = Color(uiColor: MaterialColors.surfaceContainerLow)
        static let surfaceContainerHigh = Color(uiColor: MaterialColors.surfaceContainerHigh)

        // MARK: - Background
        static let background = Color(uiColor: MaterialColors.background)
        static let onBackground = Color(uiColor: MaterialColors.onBackground)

        // MARK: - Outline
        static let outline = Color(uiColor: MaterialColors.outline)
        static let outlineVariant = Color(uiColor: MaterialColors.outlineVariant)

        // MARK: - Inverse
        static let inverseSurface = Color(uiColor: MaterialColors.inverseSurface)
        static let inverseOnSurface = Color(uiColor: MaterialColors.inverseOnSurface)
        static let inversePrimary = Color(uiColor: MaterialColors.inversePrimary)

        // MARK: - Scrim
        static let scrim = Color(uiColor: MaterialColors.scrim)
    }
}
EOF
}
