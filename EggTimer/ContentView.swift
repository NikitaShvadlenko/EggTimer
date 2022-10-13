import SwiftUI

struct ContentView: View {
    @ObservedObject var eggTimer: EggTimer
    @State var mainScreenText: String = L10n.mainMenuTitle
    @State var progress: Double = 0.0

    var eggs = [
        Egg(eggType: .soft),
        Egg(eggType: .medium),
        Egg(eggType: .hard)
    ]

    var body: some View {
        ZStack {
            Color(Asset.Color.background.color)

            VStack(alignment: .center) {
                Spacer()
                Text(mainScreenText)
                    .font(.title)
                    .foregroundColor(Color(Asset.Color.titleText.color))
                Spacer()
                eggStack
                Spacer()
                mainScreenProgressView
                Spacer()
            }
            .padding()
        }
        .ignoresSafeArea()
        .onReceive(eggTimer.timer) { _ in
            guard eggTimer.timerIsActive else { return }
            progress = Double(eggTimer.timePassed/eggTimer.boilingTime)
            eggTimer.doOneTick()
            if eggTimer.timeRemaining <= 0 {
                mainScreenText = L10n.ready
            } else {
                mainScreenText = String(eggTimer.timeRemaining)
            }
        }
    }

    var eggStack: some View {
        HStack(alignment: .center, spacing: 25) {
            ForEach(eggs) { egg in
                EggImage(egg: egg)
                    .onTapGesture {
                        eggTimer.activateTimer(time: egg.cookingTime)
                    }
            }
        }
    }

    var mainScreenProgressView: some View {
        ProgressView(value: progress)
            .progressViewStyle(LinearProgressViewStyle(tint: Color(Asset.Color.progressBarColor.color)))
            .shadow(
                color: Color(Asset.Color.progressBarShadow.color),
                radius: 8,
                x: 1,
                y: 2
            )

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(eggTimer: EggTimer())
    }
}
