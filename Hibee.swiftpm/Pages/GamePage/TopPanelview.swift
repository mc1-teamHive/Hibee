import SwiftUI



struct TopPanelView: View {
    @EnvironmentObject var gameState: GameState
 
    
  
    var body: some View {
        HStack {
            VStack {
                Text("Round \(gameState.currentBossIndex+1)/3")
                    .panelTextStyle()
                    .multilineTextAlignment(.leading)
                Spacer().frame(width: 10)
                HStack{
                    Text("Life")
                        .panelTextStyle()
                    ForEach(0..<max(1, gameState.remainingLives), id: \.self ) { _ in
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
