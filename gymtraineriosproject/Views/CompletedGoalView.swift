import SwiftUI
import ConfettiView

struct CompleteGoalView: View {
    
    let confettiView = ConfettiView( confetti: [
        .text("🎉"),
                .text("💪")
            ])    
    
    var body: some View {
        ZStack {
            confettiView

            VStack {
                Text("🎉 Congrats! 🎉")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)

                Text("The goal is completed!")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.bottom, 40)

                Image(systemName: "star.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.yellow)

                Text("You're a star!")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top, 20)
            }
        }
    }
}
