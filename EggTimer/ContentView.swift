import SwiftUI

struct ContentView: View {
    @StateObject var eggTimer = EggTimer()

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
                Text(L10n.mainMenuTitle)
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
        .environmentObject(eggTimer)
        .ignoresSafeArea()
    }

    var eggStack: some View {
        HStack(alignment: .center, spacing: 25) {
            ForEach(eggs) { egg in
                EggImage(egg: egg)
            }
        }
    }

    var mainScreenProgressView: some View {
        ProgressView(value: eggTimer.progress)
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
            .environmentObject(EggTimer())
    }
}
