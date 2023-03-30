//
//  SwiftUIView.swift
//
//
//  Created by Ha Jong Myeong on 2023/03/28.
//
import SwiftUI


struct BossView: View {
    @EnvironmentObject var gameState: GameState
    var body: some View {
        switch(gameState.currentBossIndex){
        case 0:
            Image("Isaac_\(gameState.howmanyattack)").resizable()
                .frame(width: 500, height: 500)
        case 1:
            Image("Gommin_\(gameState.howmanyattack)").resizable().frame(width: 500, height: 500)
        case 2:
            Image("Tim_\(gameState.howmanyattack)").resizable().frame(width: 500,height: 500)
        default:
            Image("Issac_1")
        }
     

    }
}

struct BossView_Previews: PreviewProvider {
    static var previews: some View {
        BossView()
    }
}
