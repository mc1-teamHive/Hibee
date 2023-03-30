import SwiftUI

struct PanelStats {
    let round: Int
    let totalRounds: Int
}

struct TopPanelView: View {
    @EnvironmentObject var gameState: GameState
    let gameStats: PanelStats
    
    init(gameStats: PanelStats = PanelStats(round: 1, totalRounds: 3)) {
        self.gameStats = gameStats
    }
    var body: some View {
        HStack {
            VStack {
                Text("Round \(gameStats.round)/\(gameStats.totalRounds)")
                    .panelTextStyle()
                    .multilineTextAlignment(.leading)
                Spacer().frame(width: 10)
                HStack{
                    Text("Life")
                        .panelTextStyle()
                    ForEach(0..<3) { _ in
                        Image("Heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35,height: 35)
                        
                    }
//                    Text(String(repeating: "♥️", count: gameState.remainingLives))
//                    .padding(.bottom, 10)
                }
            }.frame(height: 20)
                .padding(.top, 30)
                .padding(.horizontal, 10)
            
            Spacer()
        }
    }
}

extension Text {
    func panelTextStyle() -> Text {
        self.font(.system(size: 30, weight: .heavy))
            .foregroundColor(Color(.white))
    }
}

struct TopPanelView_Previews: PreviewProvider {
    static var previews: some View {
        TopPanelView()
    }
}
