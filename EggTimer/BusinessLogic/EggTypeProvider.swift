import Foundation

struct EggTypeProvider {
    func fetchEggTypes() -> [Egg] {
        return [
            Egg(eggType: .soft),
            Egg(eggType: .medium),
            Egg(eggType: .hard)
        ]
    }
}
