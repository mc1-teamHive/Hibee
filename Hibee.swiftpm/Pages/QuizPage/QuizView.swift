import SwiftUI

struct QuizView: View {

    @State var round: Int = 1
    @State private var isAnswer = false
    @State private var btnclick = false

    let randomInt = Int.random(in: 0..<quizzes.count)

    var body: some View {
        GeometryReader {
            geo in
            HStack() {


                Image("Quiz1").resizable().frame(width: 536, height: 750).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 80))

                VStack(spacing: 72) {
                    ForEach(1...3, id: \.self) { index in
                        Button(action: {
                            checkAnswer(index: index)
                        }) {
                            RoundedRectangle(cornerRadius: 100)
                                .fill(Color.white)
                                .frame(width: 548 , height: 120)
                                .overlay(Text("\(quizzes[randomInt].options[index-1])").font(.system(size: 30, weight: .bold)).foregroundColor(.black))
                        }
                    }
                }
            }.frame(width: geo.size.width, height:  geo.size.height)
            
        }
        .sheet(isPresented: $btnclick) {
            AnswerSheetView(questionNum: randomInt, isCorrect: $isAnswer)
        }
    }

    private func checkAnswer(index: Int) {
        if quizzes[randomInt].answer == index-1 {
            isAnswer = true
        } else {
            isAnswer = false
        }
        btnclick = true
    }
}

