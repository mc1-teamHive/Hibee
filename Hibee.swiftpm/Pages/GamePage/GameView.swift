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
            
        } .background(
            Image("backgrounds_1")
        )
        
    }
}
