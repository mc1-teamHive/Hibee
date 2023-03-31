//
//  SwiftUIView.swift
//
//
//  Created by 235 on 2023/03/29.
//

import SwiftUI

struct AnswerSheetView: View {
    @Environment(\.presentationMode) var presentationMode
    let questionNum: Int
    @EnvironmentObject var gameState : GameState
    @Binding var isCorrect: Bool
    @Binding var isPresented : Bool
    let Text1 = "목숨이 없으시군요?"
    let Text2 = "저는 핫도그를 좋아하는 시저라고 합니다"
    let Text4 = "목숨과도 같은 "
    let Text5 = "핫도그를 드릴게요"

    var body: some View {
        if(gameState.remainingLives <= 0 && isCorrect == false ){
            VStack{
                Text("핫도그 타임")
                    .font(.system(size: 80, weight: .bold))
                    .padding(.top, 100)
                    .padding(.bottom, 30)
                Text(Text1).hotDogTextStyle().padding(.bottom, 1)
                Text(Text2).hotDogTextStyle().padding(.bottom, 1)
                HStack(alignment: .top, spacing: 0){
                    Text(Text4).hotDogTextStyle2()
                    Text(Text5).hotDogTextStyle()
                }
                Spacer()
                Image("Caesar")
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
                    .font(.system(size: 90, weight: .black))
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
                self.presentationMode.wrappedValue.dismiss()
            }
        }}
}

extension Text {
    func hotDogTextStyle() -> Text {
        self.font(.system(size: 30, weight: .medium))
    }
}
extension Text {
    func hotDogTextStyle2() -> Text {
        self.font(.system(size: 30, weight: .bold))
    }
}

struct AnswerSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerSheetView(questionNum: 1, isCorrect: .constant(true), isPresented: .constant(true))
    }
}
