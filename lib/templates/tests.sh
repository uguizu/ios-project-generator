#!/bin/bash
# ─── Test Files ───────────────────────────────────────────────────────────────

generate_unit_tests() {
    local base_dir="$1"

    if [[ "$SWIFT_VERSION" == "6" ]]; then
        cat <<EOF > "${base_dir}/Tests/${PROJECT_NAME}Tests/${PROJECT_NAME}Tests.swift"
import Testing
@testable import ${PROJECT_NAME}

struct ${PROJECT_NAME}Tests {
    @Test func example() async throws {
        #expect(true)
    }
}
EOF
    else
        cat <<EOF > "${base_dir}/Tests/${PROJECT_NAME}Tests/${PROJECT_NAME}Tests.swift"
import XCTest
@testable import ${PROJECT_NAME}

final class ${PROJECT_NAME}Tests: XCTestCase {
    func testExample() throws {
        XCTAssertTrue(true)
    }
}
EOF
    fi
}

generate_ui_tests() {
    local base_dir="$1"

    cat <<EOF > "${base_dir}/UITests/${PROJECT_NAME}UITests/${PROJECT_NAME}UITests.swift"
import XCTest

final class ${PROJECT_NAME}UITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testAppLaunches() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.staticTexts["Hello, world!"].exists)
    }
}
EOF
}
