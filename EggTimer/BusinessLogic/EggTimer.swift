import SwiftUI

final class EggTimer: ObservableObject {
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @Published var timerIsActive = false
    @Published var timeRemaining = 0.0
    @Published var timePassed = 0.0

    @Published var boilingTime = 0.0 {
        didSet {
            timeRemaining = boilingTime
        }
    }

    func doOneTick() {
        if timeRemaining > 0 {
            timeRemaining -= 0.1
        } else {
            timeRemaining = 0
            timerIsActive = false
        }
        timePassed = boilingTime - timeRemaining
    }

    func activateTimer(time: Double) {
        self.boilingTime = time
        self.timerIsActive = true
    }
}
