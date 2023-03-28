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
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().previewInterfaceOrientation(.landscapeLeft)
    }
}
