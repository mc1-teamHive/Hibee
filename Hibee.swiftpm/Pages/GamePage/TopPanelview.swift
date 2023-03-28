import SwiftUI

struct GameStats {
    let round: Int
    let totalRounds: Int
    let remainingLives: Int
}

struct TopPanelView: View {
    let gameStats = GameStats(round: 1, totalRounds: 3, remainingLives: 3)
    
    var body: some View {
        HStack {
            VStack {
                Text("Round \(gameStats.round)/\(gameStats.totalRounds)")
                    .panelTextStyle()
                Spacer().frame(width: 10)
                HStack{
                    Text("Life")
                        .panelTextStyle()
                    Text(String(repeating: "♥️", count: gameStats.remainingLives))
                    .padding(.bottom, 10)}
            }.frame(height: 20)
            .padding(.top, 30)
            .padding(.horizontal, 10)
            
            Spacer()
        }
    }
}

extension Text {
    func panelTextStyle() -> Text {
        self.font(.headline)
            .foregroundColor(Color(red: 74/255, green: 91/255, blue: 109/255))
    }
}

struct TopPanelView_Previews: PreviewProvider {
    static var previews: some View {
        TopPanelView()
    }
}
