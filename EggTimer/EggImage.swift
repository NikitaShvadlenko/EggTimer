import SwiftUI

struct EggImage: View {
    var viewModel: EggImageViewModel
    @State private var opacity = 1.0

    var body: some View {
        ZStack {
            eggImage
                .opacity(opacity)
            Text(viewModel.eggTypeName)
                .fontWeight(.heavy)
                .font(.title2)
                .lineLimit(1)
                .foregroundColor(Color(Asset.Color.eggStyleText.color))
                .aspectRatio(contentMode: .fit)
                .minimumScaleFactor(0.4)
                .opacity(opacity)
                .opacity(opacity)
        }
        .onTapGesture {
            withAnimation(Animation.linear(duration: 0.2)) {
                opacity -= 1

            }
            withAnimation(Animation.linear(duration: 0.2).delay(0.2)) {
                opacity = 1
            }
            viewModel.activateTimer()
        }
    }

    var eggImage: some View {
        Image(viewModel.eggImageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct EggImage_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EggImageViewModel(
            egg: SampleData().egg,
            eggTimer: EggTimer()
        )

        EggImage(
            viewModel: viewModel
        )
    }
}
