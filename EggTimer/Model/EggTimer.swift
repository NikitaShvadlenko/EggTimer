import Foundation

@MainActor class EggTimer: ObservableObject {
    @Published var boilingTime: Double = 0
    @Published var timePassed: Double = 0
    @Published var progress: Double = 0
    var timer = Timer()

    func runTimer(for eggType: EggType) {
        cancelPreviousTimer()

        setBoilingTime(for: eggType)
           timer = Timer.scheduledTimer(
                timeInterval: 0.1,
                target: self,
                selector: #selector(self.updateCounter),
                userInfo: nil,
                repeats: true
            )
    }

   private func setBoilingTime(for eggType: EggType) {
        switch eggType {
        case .soft:
            boilingTime = 10
        case .medium:
            boilingTime = 15
        case .hard:
            boilingTime = 20
        }
    }

    func cancelPreviousTimer() {
        timer.invalidate()
        timePassed = 0
        boilingTime = 0
        progress = 0
    }

    @objc
    func updateCounter() {
        if timePassed < boilingTime {
            progress = timePassed/boilingTime
            timePassed += 0.1
            print(timePassed)
        } else {
            timer.invalidate()
        }
    }
}
