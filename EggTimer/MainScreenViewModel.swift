import SwiftUI

final class MainScreenViewModel: ObservableObject {
    @Published var progress: Double = 0
    @Published var mainScreenText: String = L10n.mainMenuTitle

    let musicPlayer = MusicPlayer()
    let eggProvider = EggTypeProvider()
    var eggTimer: EggTimer
    var eggs: [Egg]

    init(eggTimer: EggTimer) {
        self.eggTimer = eggTimer
        eggs = eggProvider.fetchEggTypes()
    }

    func updateViews() {
        guard eggTimer.timerIsActive else { return }
        eggTimer.doOneTick()
        if eggTimer.timeRemaining <= 0 {
            suggestToBoilMoreEggs()
            mainScreenText = L10n.ready
            musicPlayer.playSound(sound: .alarmSound)
        } else {
            mainScreenText = configureMainScreenCountdown(eggTimer.timeRemaining)
        }
        progress = Double(eggTimer.timePassed)/Double(eggTimer.boilingTime)
    }

    private func suggestToBoilMoreEggs() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [ weak self ] in
            guard let self = self else { return }
            if !self.eggTimer.timerIsActive {
                self.mainScreenText = L10n.cookMore
            }
        }
    }

    private func configureMainScreenCountdown(_ seconds: Int) -> String {
        let formatter = DateFormatter()
        let timeInterval = TimeInterval(seconds)
        let date = Date(timeIntervalSince1970: timeInterval)
        formatter.dateFormat = "mm:ss"
        return formatter.string(from: date)
    }
}
