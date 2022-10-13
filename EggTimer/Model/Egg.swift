import Foundation

struct Egg: Identifiable {
    // swiftlint:disable identifier_name
    var id: String { UUID().uuidString}
    let name: String
    let imageName: String
    let eggType: EggType
    let cookingTime: Double

    init(eggType: EggType) {
        self.eggType = eggType

        switch eggType {
        case .soft:
            name = L10n.soft
            imageName = Asset.softEgg.name
            cookingTime = 10.0
        case .medium:
            name = L10n.medium
            imageName = Asset.mediumEgg.name
            cookingTime = 20.0
        case .hard:
            name = L10n.hard
            imageName = Asset.hardEgg.name
            cookingTime = 30.0
        }
    }
}
