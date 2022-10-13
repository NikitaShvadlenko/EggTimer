import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MainScreenViewModel

    var body: some View {
        ZStack {
            Color(Asset.Color.background.color)

            VStack(alignment: .center) {
                Spacer()
                Text(viewModel.mainScreenText)
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
        .onReceive(viewModel.eggTimer.timer) { _ in
            viewModel.updateViews()
        }
    }

    var eggStack: some View {
        HStack(alignment: .center, spacing: 25) {
            ForEach(viewModel.eggs) { egg in
                EggImage(viewModel: EggImageViewModel(egg: egg, eggTimer: viewModel.eggTimer))
            }
        }
    }

    var mainScreenProgressView: some View {
        ProgressView(value: viewModel.progress)
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
        let eggTimer = EggTimer()
        ContentView(
            viewModel: MainScreenViewModel(eggTimer: eggTimer)
        )
    }
}
