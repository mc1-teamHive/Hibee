//
//  SwiftUIView.swift
//
//
//  Created by 235 on 2023/03/29.
//

import SwiftUI

struct AnswerSheetView: View {
    let questionNum: Int
    @Binding var isCorrect: Bool
    
    var body: some View {
        VStack {
            Text(isCorrect ? "정답입니다" : "오답입니다.")
                .font(.system(size: 80, weight: .bold))
                .padding(.top, 100)
                .padding(.bottom, 50)
            Text(quizzes[questionNum].description)
                .font(.system(size: 30, weight: .medium))
                .frame(maxWidth: .infinity, maxHeight: 200)
                .lineLimit(5)
            Spacer()
            Image(isCorrect ? "Caesar" : "Wrongperson")
                .resizable()
                .frame(width: 400, height: 400)
        }
    }
}
