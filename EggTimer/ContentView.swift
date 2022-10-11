import SwiftUI

struct ContentView: View {
    var eggs = [
        Egg(name: L10n.hard, imageName: Asset.hardEgg.name),
        Egg(name: L10n.medium, imageName: Asset.mediumEgg.name),
        Egg(name: L10n.soft, imageName: Asset.softEgg.name)
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
        .ignoresSafeArea()
    }

    var eggStack: some View {
        HStack(alignment: .top, spacing: 25) {
            ForEach(eggs) { egg in
                EggImage(egg: egg)
            }
        }
    }

    var mainScreenProgressView: some View {
        ProgressView(value: 1)
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
