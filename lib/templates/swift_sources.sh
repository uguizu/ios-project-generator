#!/bin/bash
# ─── SwiftUI Source Files ─────────────────────────────────────────────────────

generate_app_swift() {
    local base_dir="$1"

    cat <<EOF > "${base_dir}/Sources/${PROJECT_NAME}/${PROJECT_NAME}App.swift"
import SwiftUI

@main
struct ${PROJECT_NAME}App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
EOF
}

generate_content_view() {
    local base_dir="$1"
    local major="${DEPLOYMENT_TARGET%%.*}"

    if [ "$major" -ge 17 ]; then
        cat <<EOF > "${base_dir}/Sources/${PROJECT_NAME}/ContentView.swift"
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
EOF
    else
        cat <<EOF > "${base_dir}/Sources/${PROJECT_NAME}/ContentView.swift"
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
EOF
    fi
}

generate_assets() {
    local base_dir="$1"
    local assets_dir="${base_dir}/Sources/${PROJECT_NAME}/Assets.xcassets"

    # Root Contents.json
    cat <<'JSON' > "${assets_dir}/Contents.json"
{
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
JSON

    # AccentColor
    cat <<'JSON' > "${assets_dir}/AccentColor.colorset/Contents.json"
{
  "colors" : [
    {
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
JSON

    # AppIcon
    cat <<'JSON' > "${assets_dir}/AppIcon.appiconset/Contents.json"
{
  "images" : [
    {
      "idiom" : "universal",
      "platform" : "ios",
      "size" : "1024x1024"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
JSON

    # Preview Assets
    cat <<'JSON' > "${base_dir}/Sources/${PROJECT_NAME}/Preview Content/Preview Assets.xcassets/Contents.json"
{
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
JSON
}
