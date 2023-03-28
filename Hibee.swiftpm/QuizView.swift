//
//  QuizView.swift
//  Practice
//
//  Created by 235 on 2023/03/27.
//
import SwiftUI

struct QuizView: View {
    @Binding var cardFlip : Bool
    @State var round : Int = 1
    @State private var answerO = false
    @State private var btnclick = false
    let randomInt = Int.random(in: 0..<quizs.count)
//    func answercheck() -> some View{
//        if
//    }
    var body: some View {
        GeometryReader { geometry in
            HStack(){Spacer()
                
                
                VStack{
                    Image("카드1").resizable().frame(width: 536, height: 754)}.frame(alignment: .leading)
                Spacer()
                VStack{ Spacer()
                    Spacer()
                    Button(action: {
                        
                        if(quizs[randomInt].answernum == 1){
                            answerO = true
                        }else{answerO = false}
                        
                        btnclick = true
                    }){
                        RoundedRectangle(cornerRadius: 100).fill(Color.white).opacity(1).frame(width: 548, height: 120).overlay(Text("\(quizs[randomInt].example1)").foregroundColor(.black).font(.system(size: 30)).fontWeight(.bold))
                    }
                    Spacer()
                    Button(action: {
                        if(quizs[randomInt].answernum == 2){
                            answerO = true
                        }else{answerO = false}
                        btnclick = true
                        
                    }){
                        RoundedRectangle(cornerRadius: 100).fill(Color.white).opacity(1).frame(width: 548, height: 120).overlay(Text("\(quizs[randomInt].example2)").foregroundColor(.black).font(.system(size: 30)).fontWeight(.bold))}
                    Spacer()
                    Button(action: {
                        if(quizs[randomInt].answernum == 3){
                            answerO = true
                        }else{answerO = false}
                        btnclick = true
                    }){
                        RoundedRectangle(cornerRadius: 100).fill(Color.white).opacity(1).frame(width: 548, height: 120).overlay(Text("\(quizs[randomInt].example3)").foregroundColor(.black).font(.system(size: 30)).fontWeight(.bold))}
                    Spacer()
                    Spacer()
                    
                }
                Spacer()
            }.frame(width: geometry.size.width, height: geometry.size.height )
            
            
        }.sheet(isPresented: $btnclick){
            switch self.answerO {
            case true :
                VStack{
                    Text("정답입니다").font(.system(size: 80, weight: .bold)).padding(EdgeInsets(top: 100, leading: 0, bottom: 50, trailing: 0))
                    Text(quizs[randomInt].description).font(.system(size: 30, weight: .medium   ))
                    Spacer()
                    Image("Caesar").resizable().frame(width: 400,height: 400)
                }
            case false:
                VStack{
                    Text("오답입니다.").font(.system(size: 80, weight: .bold)).padding(EdgeInsets(top: 100, leading: 0, bottom: 50, trailing: 0))
                    Text(quizs[randomInt].description).font(.system(size: 30, weight: .medium)).frame(maxWidth: .infinity, maxHeight: 200).lineLimit(5)
                    Spacer()
                    Image("Wrongperson").resizable().frame(width: 400,height: 400)
                }
            }
        }
    }
}

struct FittingFontSizeModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 100))
      .minimumScaleFactor(0.001)
  }
}
