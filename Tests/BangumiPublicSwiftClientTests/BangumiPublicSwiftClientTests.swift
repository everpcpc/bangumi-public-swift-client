import Testing
@testable import BangumiPublicSwiftClient
import OpenAPIRuntime
import OpenAPIURLSession
import Foundation

@Test func subject() async throws {
    let client = Client(
        serverURL: URL(string: "https://api.bgm.tv")!,
        transport: URLSessionTransport()
    )
    let response = try await client.getSubjectById(path: .init(subject_id: 12))
    let subject = try response.ok.body.json
    #expect(subject.name == "ちょびっツ")
    #expect(subject.name_cn == "人形电脑天使心")
}
