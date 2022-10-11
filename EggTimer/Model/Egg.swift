import Foundation

struct Egg: Identifiable {
    // swiftlint:disable identifier_name
    var id: String { UUID().uuidString}
    let name: String
    let imageName: String
}
