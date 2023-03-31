//
//  GameView.swift
//  
//
//  Created by Ha Jong Myeong on 2023/03/26.
//

import SwiftUI
import AVFoundation
struct GameView: View {
    @EnvironmentObject var gameState: GameState
    @State var player : AVAudioPlayer?
    var body: some View {
        if gameState.isRoundEnd {
            RoundEndView().onAppear{
                player?.stop()
            }
           
        }
        else if gameState.isGameWon{
            EndingView().onAppear{
                player?.stop()
            }
                }
        else {
            VStack{
                // Spacer for dont ignore safearea
                Spacer().frame(height: 1)
                TopPanelView()
                ProgressBar()
                BossView()
                CardFlipView()
            }.onAppear{
                guard let path = Bundle.main.path(forResource: "\(gameState.currentBossIndex)", ofType: "mp3") else {return}
                let url = URL(fileURLWithPath: path)
                do{
                    player = try AVAudioPlayer(contentsOf: url)
                }catch{
                    print("error")
                }
                player?.play()
            }.navigationBarBackButtonHidden(true)
                .background(Image("background_\(gameState.currentBossIndex)").resizable().scaledToFit().frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(.all))
        }
        
    }
}
