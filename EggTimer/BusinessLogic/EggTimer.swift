import SwiftUI

final class EggTimer: ObservableObject {
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var timerIsActive = false
    @Published var timeRemaining = 0
    @Published var timePassed = 0

    @Published var boilingTime = 0 {
        didSet {
            timeRemaining = boilingTime
        }
    }

    func doOneTick() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            timeRemaining = 0
            stopTimer()
            timerIsActive = false
        }
        timePassed = boilingTime - timeRemaining
    }

    func stopTimer() {
        self.timer.upstream.connect().cancel()
    }

    func activateTimer(time: Int) {
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        self.boilingTime = time
        self.timerIsActive = true
    }
}
