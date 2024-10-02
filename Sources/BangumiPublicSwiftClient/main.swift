import OpenAPIRuntime
import OpenAPIURLSession
import Foundation

let client = Client(
    serverURL: URL(string: "https://api.bgm.tv")!,
    transport: URLSessionTransport()
)
let response = try await client.getSubjectById(path: .init(subject_id: 12))
switch response {
case .ok(let okResponse):
    switch okResponse.body {
    case .json(let subject):
        print(subject.name)
        print(subject.name_cn)
    }
case .notFound:
    print("😢 not found")
case .badRequest:
    print("😡 bad request")
case .undocumented(statusCode: let statusCode, _):
    print("🥺 undocumented response: \(statusCode)")
}
