import SwiftUI



struct ProgressBar: View {
    @EnvironmentObject var gameState: GameState
    
    @State private var healthPoint : Double = 100.0
    @State private var progressViewColor : Color = .green
    
    var body: some View {
      
        VStack {                                    //총 HP
            ProgressView("HP", value: gameState.bossHealth, total: 100)
                .progressViewStyle(RoundedRectProgressViewStyle())
                .foregroundColor(progressViewColor)
            Button {
                gameState.decreaseBossHealth()
            } label: {
                Text("Isaac")
                    .font(.system(size: 30, weight: .bold)).foregroundColor(.white)
            }

        }
        
    }
}
struct RoundedRectProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 14)
                .frame(width: 250, height: 25)
                .foregroundColor(.gray.opacity(0.25))
            RoundedRectangle(cornerRadius: 14)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 250, height: 25)
        }
        .padding()
    }
}
