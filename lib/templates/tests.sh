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

struct SampleServiceTests {
    var sut: SampleService!
    var mockNetworkClient: MockNetworkClient!

    init() {
        mockNetworkClient = MockNetworkClient()
        sut = SampleService(networkClient: mockNetworkClient)
    }

    @Test func testFetchSamplesSuccess() async throws {
        // Given
        let mockItems = [
            ItemResponse(id: "1", name: "Test Item", description: "Test")
        ]
        mockNetworkClient.mockResponse = mockItems

        // When
        let result = try await sut.fetchSamples()

        // Then
        #expect(mockNetworkClient.requestCallCount == 1)
        #expect(result.count == 1)
        #expect(result.first?.name == "Test Item")
    }

    @Test func testFetchSamplesNetworkError() async throws {
        // Given
        mockNetworkClient.mockError = NetworkError.noData

        // When/Then
        do {
            _ = try await sut.fetchSamples()
            Issue.record("Expected error to be thrown")
        } catch {
            #expect(error is NetworkError)
        }
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

final class SampleServiceTests: XCTestCase {
    var sut: SampleService!
    var mockNetworkClient: MockNetworkClient!

    override func setUp() {
        super.setUp()
        mockNetworkClient = MockNetworkClient()
        sut = SampleService(networkClient: mockNetworkClient)
    }

    override func tearDown() {
        sut = nil
        mockNetworkClient = nil
        super.tearDown()
    }

    func testFetchSamplesSuccess() async throws {
        // Given
        let mockItems = [
            ItemResponse(id: "1", name: "Test Item", description: "Test")
        ]
        mockNetworkClient.mockResponse = mockItems

        // When
        let result = try await sut.fetchSamples()

        // Then
        XCTAssertEqual(mockNetworkClient.requestCallCount, 1)
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.name, "Test Item")
    }

    func testFetchSamplesNetworkError() async throws {
        // Given
        mockNetworkClient.mockError = NetworkError.noData

        // When/Then
        do {
            _ = try await sut.fetchSamples()
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertTrue(error is NetworkError)
        }
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
