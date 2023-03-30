//
//  GameView.swift
//  
//
//  Created by Ha Jong Myeong on 2023/03/26.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameState: GameState
    var body: some View {
        if gameState.isRoundEnd {
            RoundEndView()
           
        }
        else if gameState.isGameWon{
                    EndingView()
                }
        else {
            VStack{
                // Spacer for dont ignore safearea
                Spacer().frame(height: 1)
                TopPanelView()
                ProgressBar()
                BossView()
                CardFlipView()
            }.navigationBarBackButtonHidden(true)
                .background(Image("background_\(gameState.currentBossIndex)").resizable().scaledToFit().frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(.all))
        }}
}
