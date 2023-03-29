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
            Spacer()
            BossView()
            CardFlipView()
            // PopUpView()
        }
        // need swap bkg when round changes
        .background(
            Image(uiImage: UIImage(named: "backgrounds_1")!).resizable()
            .scaledToFill())
    }
}
