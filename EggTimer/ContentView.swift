import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var mainScreenText: String = L10n.mainMenuTitle
    @State var timerIsActive = false
    @State var progress: Double = 0
    @State var timeRemaining = 0
    @State var timePassed = 0

    @State var boilingTime = 0 {
        didSet {
            timeRemaining = boilingTime
        }
    }

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
        .onReceive(timer) { _ in
            guard timerIsActive else { return }
            if timeRemaining > 0 {
                timePassed = boilingTime - timeRemaining
                progress = (Double(timePassed)/Double(boilingTime))
                mainScreenText = "\(timeRemaining)"
                timeRemaining -= 1
            } else {
                timeRemaining = 0
                timerIsActive = false
                mainScreenText = L10n.ready
            }
        }
    }

    var eggStack: some View {
        HStack(alignment: .center, spacing: 25) {
            ForEach(eggs) { egg in
                EggImage(egg: egg)
                    .onTapGesture {
                        timerIsActive = true
                        boilingTime = egg.cookingTime
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
        ContentView()
    }
}
