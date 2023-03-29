//
//  GameView.swift
//
//
//  Created by Ha Jong Myeong on 2023/03/26.
//
import SwiftUI

struct GameView: View {
    var body: some View {
        VStack{
            // Spacer for dont ignore safearea
            Spacer().frame(height: 1)
            TopPanelView()
            ProgressBar()
            BossView()
            CardFlipView()
        }.navigationBarBackButtonHidden(true)
            .background(Image("backgrounds_1").resizable().scaledToFit().frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(.all))
    }
}
