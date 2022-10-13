import SwiftUI

struct EggImage: View {

    var egg: Egg
    @State private var opacity = 1.0
    @ObservedObject var eggTimer: EggTimer

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
            withAnimation(Animation.linear(duration: 0.2)) {
                opacity -= 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(Animation.linear(duration: 0.2)) {
                        opacity = 1
                    }
                    eggTimer.activateTimer(time: egg.cookingTime)
                }
            }
        }
    }

    var eggImage: some View {
        Image(egg.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct EggImage_Previews: PreviewProvider {
    static var previews: some View {
        EggImage(
            egg: Egg(eggType: .soft),
            eggTimer: EggTimer()
        )
    }
}
