#!/bin/bash
# ─── SwiftUI Source Files ─────────────────────────────────────────────────────

generate_app_swift() {
    local base_dir="$1"

    cat <<EOF > "${base_dir}/Sources/${PROJECT_NAME}App.swift"
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
        cat <<EOF > "${base_dir}/Sources/Modules/Root/ContentView.swift"
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
        cat <<EOF > "${base_dir}/Sources/Modules/Root/ContentView.swift"
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
    local assets_dir="${base_dir}/Sources/Resources/Images/Assets.xcassets"

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
}

# ─── Network ─────────────────────────────────────────────────────────────────

generate_network() {
    local base_dir="$1"

    # Main network client implementation
    cat <<'SWIFT_EOF' > "${base_dir}/Sources/Core/Network/NetworkClient.swift"
import Foundation
import UniformTypeIdentifiers

// MARK: - Core Protocols & Types

/// Protocol defining an API endpoint (inspired by Moya's TargetType)
protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: [String: String]? { get }
}

extension Endpoint {
    var headers: [String: String]? { nil }

    var url: URL {
        baseURL.appendingPathComponent(path)
    }
}

/// HTTP methods
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

/// HTTP task types
enum HTTPTask {
    case plain
    case requestJSON(Encodable)
    case requestParameters([String: Any], encoding: ParameterEncoding)
    case uploadMultipart([MultipartFormData])
    case downloadFile(destination: URL)
}

/// Parameter encoding strategies
enum ParameterEncoding {
    case url  // Query string (GET)
    case json // Request body (POST/PUT/PATCH)
}

// MARK: - Multipart Form Data

/// Represents a single part in a multipart/form-data request
struct MultipartFormData {
    let data: Data
    let name: String
    let fileName: String?
    let mimeType: String?

    init(data: Data, name: String, fileName: String? = nil, mimeType: String? = nil) {
        self.data = data
        self.name = name
        self.fileName = fileName
        self.mimeType = mimeType
    }

    static func image(_ data: Data, name: String, fileName: String = "photo.jpg") -> MultipartFormData {
        MultipartFormData(data: data, name: name, fileName: fileName, mimeType: "image/jpeg")
    }

    static func file(_ url: URL, name: String) throws -> MultipartFormData {
        let data = try Data(contentsOf: url)
        let fileName = url.lastPathComponent
        let mimeType = url.mimeType
        return MultipartFormData(data: data, name: name, fileName: fileName, mimeType: mimeType)
    }
}

// MARK: - Network Errors

enum NetworkError: LocalizedError {
    case invalidURL
    case noData
    case decodingFailed(Error)
    case encodingFailed(Error)
    case httpError(statusCode: Int, data: Data?)
    case uploadFailed(Error)
    case downloadFailed(Error)
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data received from server"
        case .decodingFailed(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        case .encodingFailed(let error):
            return "Failed to encode request: \(error.localizedDescription)"
        case .httpError(let statusCode, _):
            return "HTTP error \(statusCode)"
        case .uploadFailed(let error):
            return "Upload failed: \(error.localizedDescription)"
        case .downloadFailed(let error):
            return "Download failed: \(error.localizedDescription)"
        case .unknown(let error):
            return "Unknown error: \(error.localizedDescription)"
        }
    }
}

// MARK: - Network Client Protocol

protocol NetworkClientProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
    func request(_ endpoint: Endpoint) async throws
    func upload(_ endpoint: Endpoint, progress: ((Double) -> Void)?) async throws
    func download(_ endpoint: Endpoint, progress: ((Double) -> Void)?) async throws -> URL
}

// MARK: - Network Client Implementation

struct NetworkClient: NetworkClientProtocol {
    let session: URLSession
    let decoder: JSONDecoder
    let encoder: JSONEncoder

    init(
        session: URLSession = .shared,
        decoder: JSONDecoder = JSONDecoder(),
        encoder: JSONEncoder = JSONEncoder()
    ) {
        self.session = session
        self.decoder = decoder
        self.encoder = encoder
    }

    // MARK: Request with Decodable Response

    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        let request = try buildRequest(from: endpoint)
        let (data, response) = try await session.data(for: request)

        try validateResponse(response, data: data)

        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed(error)
        }
    }

    // MARK: Request without Response

    func request(_ endpoint: Endpoint) async throws {
        let request = try buildRequest(from: endpoint)
        let (data, response) = try await session.data(for: request)
        try validateResponse(response, data: data)
    }

    // MARK: Upload

    func upload(_ endpoint: Endpoint, progress: ((Double) -> Void)? = nil) async throws {
        let request = try buildRequest(from: endpoint)
        let (data, response) = try await session.data(for: request)
        try validateResponse(response, data: data)
    }

    // MARK: Download

    func download(_ endpoint: Endpoint, progress: ((Double) -> Void)? = nil) async throws -> URL {
        guard case .downloadFile(let destination) = endpoint.task else {
            throw NetworkError.invalidURL
        }

        let request = try buildRequest(from: endpoint)
        let (tempURL, response) = try await session.download(for: request)

        try validateResponse(response, data: nil)

        try? FileManager.default.removeItem(at: destination)
        try FileManager.default.moveItem(at: tempURL, to: destination)

        return destination
    }

    // MARK: - Private Helpers

    private func buildRequest(from endpoint: Endpoint) throws -> URLRequest {
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = endpoint.method.rawValue

        endpoint.headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }

        switch endpoint.task {
        case .plain:
            break

        case .requestJSON(let encodable):
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            do {
                request.httpBody = try encoder.encode(AnyEncodable(encodable))
            } catch {
                throw NetworkError.encodingFailed(error)
            }

        case .requestParameters(let parameters, let encoding):
            try applyParameters(parameters, encoding: encoding, to: &request)

        case .uploadMultipart(let parts):
            let boundary = "Boundary-\(UUID().uuidString)"
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            request.httpBody = createMultipartBody(parts: parts, boundary: boundary)

        case .downloadFile:
            break
        }

        return request
    }

    private func applyParameters(
        _ parameters: [String: Any],
        encoding: ParameterEncoding,
        to request: inout URLRequest
    ) throws {
        switch encoding {
        case .url:
            guard let url = request.url else {
                throw NetworkError.invalidURL
            }

            if var components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                let queryItems = parameters.map { key, value in
                    URLQueryItem(name: key, value: "\(value)")
                }
                components.queryItems = queryItems
                request.url = components.url
            }

        case .json:
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            } catch {
                throw NetworkError.encodingFailed(error)
            }
        }
    }

    private func createMultipartBody(parts: [MultipartFormData], boundary: String) -> Data {
        var body = Data()
        let boundaryPrefix = "--\(boundary)\r\n"

        for part in parts {
            body.append(boundaryPrefix.data(using: .utf8)!)

            var disposition = "Content-Disposition: form-data; name=\"\(part.name)\""
            if let fileName = part.fileName {
                disposition += "; filename=\"\(fileName)\""
            }
            disposition += "\r\n"
            body.append(disposition.data(using: .utf8)!)

            if let mimeType = part.mimeType {
                body.append("Content-Type: \(mimeType)\r\n".data(using: .utf8)!)
            }

            body.append("\r\n".data(using: .utf8)!)
            body.append(part.data)
            body.append("\r\n".data(using: .utf8)!)
        }

        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        return body
    }

    private func validateResponse(_ response: URLResponse, data: Data?) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            return
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.httpError(statusCode: httpResponse.statusCode, data: data)
        }
    }
}

// MARK: - Helper Types

private struct AnyEncodable: Encodable {
    private let _encode: (Encoder) throws -> Void

    init(_ encodable: Encodable) {
        _encode = encodable.encode(to:)
    }

    func encode(to encoder: Encoder) throws {
        try _encode(encoder)
    }
}

// MARK: - URL Extensions

private extension URL {
    var mimeType: String? {
        guard let uti = UTType(filenameExtension: pathExtension) else {
            return nil
        }
        return uti.preferredMIMEType
    }
}
SWIFT_EOF

    # Sample API endpoint enum
    cat <<EOF > "${base_dir}/Sources/Core/Services/Sample/SampleAPI.swift"
import Foundation

/// Example API endpoint enum demonstrating the Endpoint pattern
enum SampleAPI {
    case fetchItems
    case fetchItem(id: String)
    case createItem(name: String, description: String)
    case updateItem(id: String, name: String)
    case deleteItem(id: String)
}

extension SampleAPI: Endpoint {
    var baseURL: URL {
        // Load from configuration (set in Debug.xcconfig / Release.xcconfig)
        URL(string: Configuration.baseURL)!
    }

    var path: String {
        switch self {
        case .fetchItems:
            return "/items"
        case .fetchItem(let id):
            return "/items/\(id)"
        case .createItem:
            return "/items"
        case .updateItem(let id, _):
            return "/items/\(id)"
        case .deleteItem(let id):
            return "/items/\(id)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .fetchItems, .fetchItem:
            return .get
        case .createItem:
            return .post
        case .updateItem:
            return .put
        case .deleteItem:
            return .delete
        }
    }

    var task: HTTPTask {
        switch self {
        case .fetchItems, .fetchItem, .deleteItem:
            return .plain

        case .createItem(let name, let description):
            let body = CreateItemRequest(name: name, description: description)
            return .requestJSON(body)

        case .updateItem(_, let name):
            let body = UpdateItemRequest(name: name)
            return .requestJSON(body)
        }
    }

    var headers: [String: String]? {
        return [
            "Accept": "application/json"
        ]
    }
}

// MARK: - Request Models

struct CreateItemRequest: Encodable {
    let name: String
    let description: String
}

struct UpdateItemRequest: Encodable {
    let name: String
}
EOF
}

# ─── Services ────────────────────────────────────────────────────────────────

generate_services() {
    local base_dir="$1"

    # Sample Model
    cat <<EOF > "${base_dir}/Sources/Core/Models/SampleModel.swift"
import Foundation

struct SampleModel: Identifiable {
    let id: UUID
    let name: String
}
EOF

    # Service Protocol
    cat <<EOF > "${base_dir}/Sources/Core/Services/Sample/SampleServiceProtocol.swift"
import Foundation

protocol SampleServiceProtocol {
    func fetchSamples() async throws -> [SampleModel]
}
EOF

    # Service Implementation
    cat <<EOF > "${base_dir}/Sources/Core/Services/Sample/SampleService.swift"
import Foundation

struct SampleService: SampleServiceProtocol {
    let networkClient: NetworkClientProtocol

    init(networkClient: NetworkClientProtocol = NetworkClient()) {
        self.networkClient = networkClient
    }

    func fetchSamples() async throws -> [SampleModel] {
        let response: [ItemResponse] = try await networkClient.request(SampleAPI.fetchItems)
        return response.map { SampleModel(id: UUID(), name: \$0.name) }
    }
}

// MARK: - Response Models

struct ItemResponse: Decodable {
    let id: String
    let name: String
    let description: String
}
EOF
}

# ─── Network Mocks ────────────────────────────────────────────────────────────

generate_network_mocks() {
    local base_dir="$1"

    cat <<EOF > "${base_dir}/Tests/${PROJECT_NAME}Tests/Mocks/MockNetworkClient.swift"
import Foundation
@testable import ${PROJECT_NAME}

/// Mock network client for testing. Uses a class for simplicity in test scenarios.
final class MockNetworkClient: NetworkClientProtocol {
    var requestCallCount = 0
    var mockResponse: Any?
    var mockError: Error?

    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        requestCallCount += 1
        if let error = mockError {
            throw error
        }
        guard let response = mockResponse as? T else {
            throw NetworkError.noData
        }
        return response
    }

    func request(_ endpoint: Endpoint) async throws {
        requestCallCount += 1
        if let error = mockError {
            throw error
        }
    }

    func upload(_ endpoint: Endpoint, progress: ((Double) -> Void)?) async throws {
        requestCallCount += 1
        if let error = mockError {
            throw error
        }
    }

    func download(_ endpoint: Endpoint, progress: ((Double) -> Void)?) async throws -> URL {
        requestCallCount += 1
        if let error = mockError {
            throw error
        }
        return URL(fileURLWithPath: "/tmp/test.txt")
    }
}
EOF
}

# ─── Configuration ───────────────────────────────────────────────────────────

generate_configuration() {
    local base_dir="$1"

    cat <<EOF > "${base_dir}/Sources/Configuration/Debug.xcconfig"
// Debug.xcconfig
// Configuration settings for Debug builds

// API Configuration
API_BASE_URL = https:/\$()/api.example.com
EOF

    cat <<EOF > "${base_dir}/Sources/Configuration/Release.xcconfig"
// Release.xcconfig
// Configuration settings for Release builds

// API Configuration
API_BASE_URL = https:/\$()/api.example.com
EOF
}

# ─── Utils ────────────────────────────────────────────────────────────────────

generate_utils() {
    local base_dir="$1"

    cat <<'EOF' > "${base_dir}/Sources/Core/Utils/Configuration.swift"
import Foundation

/// Application configuration values from Info.plist
enum Configuration {
    /// Base URL for API requests
    ///
    /// This value is set in Debug.xcconfig and Release.xcconfig files
    /// and injected into Info.plist during build.
    static var baseURL: String {
        guard let urlString = Bundle.main.object(forInfoDictionaryKey: "APIBaseURL") as? String else {
            fatalError("APIBaseURL not found in Info.plist. Check Debug.xcconfig and Release.xcconfig.")
        }
        return urlString
    }
}
EOF
}
