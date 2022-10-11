import SwiftUI

struct EggImage: View {

    var egg: Egg
    @State private var opacity = 1.0

    var body: some View {
        ZStack {
            eggImage
                .opacity(opacity)

            Button {
                withAnimation(fadeInFadeOutAnimation()) {
                    opacity -= 0.4
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    opacity = 1
                }
            } label: {
                Text(egg.name)
                    .fontWeight(.heavy)
                    .frame(height: 100)
                    .font(.title)
                    .lineLimit(1)
                    .foregroundColor(Color(Asset.Color.eggStyleText.color))
                    .aspectRatio(contentMode: .fit)
                    .minimumScaleFactor(0.4)
                    .opacity(opacity)
            }
            .opacity(opacity)
        }
    }

     var eggImage: some View {
        Image(egg.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }

     var fadeInFadeOutAnimation = {
         Animation.linear(duration: 0.3)
            .repeatCount(2, autoreverses: true)
    }
}

struct EggImage_Previews: PreviewProvider {
    static var previews: some View {
        EggImage(
            egg: Egg.init(
                name: L10n.hard,
                imageName: Asset.hardEgg.name
            )
        )
    }
}
