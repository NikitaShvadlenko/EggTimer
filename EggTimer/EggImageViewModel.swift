import Foundation

final class EggImageViewModel: ObservableObject {
    var eggTimer: EggTimer
    var egg: Egg
    var eggImageName: String = " "
    var eggTypeName: String = " "

    init(egg: Egg, eggTimer: EggTimer) {
        self.egg = egg
        self.eggTimer = eggTimer
        self.eggImageName = egg.imageName
        self.eggTypeName = egg.name
    }

    func activateTimer() {
        eggTimer.activateTimer(time: egg.cookingTime)
    }

}

struct SampleData {
    let egg = Egg(eggType: .hard)
}
