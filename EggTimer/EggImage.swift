import SwiftUI

struct EggImage: View {

    var egg: Egg
    @State private var opacity = 1.0

    var body: some View {
        ZStack {
            eggImage
                .opacity(opacity)
            Text(egg.name)
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
            withAnimation(fadeInFadeOutAnimation()) {
                opacity -= 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation(fadeInFadeOutAnimation()) {
                        opacity = 1
                    }
                }
            }
        }
    }

     var eggImage: some View {
        Image(egg.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }

     var fadeInFadeOutAnimation = {
         Animation.linear
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
