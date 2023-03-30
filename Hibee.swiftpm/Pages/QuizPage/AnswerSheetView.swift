//
//  SwiftUIView.swift
//
//
//  Created by 235 on 2023/03/29.
//

import SwiftUI

struct AnswerSheetView: View {
    let questionNum: Int
    @EnvironmentObject var gameState : GameState
    @Binding var isCorrect: Bool
    @Binding var isPresented : Bool

    var body: some View {
        if(gameState.remainingLives == 0 ){
            VStack{
                Text("핫도그 타임")
                    .font(.system(size: 80, weight: .bold))
                    .padding(.top, 100)
                    .padding(.bottom, 50)
                Text("목숨이 하나 남으셨군요? 저는 핫도그를 좋아하는 시저라고 합니다 문제를 맞추시면 목숨과도 같은 핫도그를 드립니다")
                    .font(.system(size: 30, weight: .medium))
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .lineLimit(3)
                Spacer()
                Image("wrong_caesar")
                    .resizable()
                .frame(width: 400, height: 400)
            }.frame(width: 964, height: 864)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 40.0, style: .continuous))
                .onTapGesture {
                    isPresented.toggle()
                }
  
            }
        else{
            VStack {
                Text(isCorrect ? "정답입니다" : "오답입니다.")
                    .font(.system(size: 90, weight: .heavy))
                    .padding(.top, 100)
                    .padding(.bottom, 50)
                Text(quizzes[questionNum].description)
                    .font(.system(size: 40, weight: .semibold))
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .lineLimit(5)
                Spacer()
                Image(isCorrect ? "Rightperson" : "Wrongperson")
                    .resizable()
                    .frame(width: 400, height: 400)
            }
            .frame(width: 964, height: 864)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 40.0, style: .continuous))
            .onTapGesture {
                isPresented.toggle()
            }
        }}
}

struct AnswerSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerSheetView(questionNum: 1, isCorrect: .constant(true), isPresented: .constant(true))
    }
}
