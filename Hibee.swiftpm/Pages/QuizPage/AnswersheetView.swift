//
//  SwiftUIView.swift
//  
//
//  Created by 235 on 2023/03/29.
//

import SwiftUI

struct AnswerSheetView: View {
    var questionnum : Int
    @Binding var answercorrect : Bool
    var body: some View{
        if(answercorrect){
            VStack{
                Text("정답입니다").font(.system(size: 80, weight: .bold)).padding(EdgeInsets(top: 100, leading: 0, bottom: 50, trailing: 0))
                Text(quizs[questionnum].description).font(.system(size: 30, weight: .medium ))
                Spacer()
                Image("Caesar").resizable().frame(width: 400,height: 400)
            }
        }
        else{
            VStack{
                Text("오답입니다.").font(.system(size: 80, weight: .bold)).padding(EdgeInsets(top: 100, leading: 0, bottom: 50, trailing: 0))
                Text(quizs[questionnum].description).font(.system(size: 30, weight: .medium)).frame(maxWidth: .infinity, maxHeight: 200).lineLimit(5)
                Spacer()
                Image("Wrongperson").resizable().frame(width: 400,height: 400)
            }
        }
    }
}
