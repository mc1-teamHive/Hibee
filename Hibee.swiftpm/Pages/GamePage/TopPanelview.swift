//
//  GameView.swift
//
//
//  Created by Ha Jong Myeong on 2023/03/26.
//
import SwiftUI

struct PanelStats {
    let round: Int
    let totalRounds: Int
    let remainingLives: Int
}

struct TopPanelView: View {
    let gameStats = PanelStats(round: 1, totalRounds: 3, remainingLives: 3)
    
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
                    .padding(.bottom, 10)
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
        self.font(.system(size: 30))
            .foregroundColor(Color(.white))
            .fontWeight(.heavy)
    }
}

struct TopPanelView_Previews: PreviewProvider {
    static var previews: some View {
        TopPanelView()
    }
}
