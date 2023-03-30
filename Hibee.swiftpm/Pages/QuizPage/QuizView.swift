import SwiftUI


struct QuizView: View {
    @EnvironmentObject var gameState : GameState
    @State private var isAnswer = false
    @State private var btnclick = false
    @Binding var isPresented : Bool
    let randomInt = Int.random(in: 0..<quizzes.count)

    var body: some View {
        GeometryReader { geo in
            HStack() {
                if !btnclick {
                    Image("\(randomInt)").resizable().frame(width: 536, height: 750).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 80))

                    VStack(spacing: 72) {
                        ForEach(1...3, id: \.self) { index in
                            Button {
                                checkAnswer(index: index)
                            } label: {
                                RoundedRectangle(cornerRadius: 100)
                                    .fill(Color.white)
                                    .frame(width: 548 , height: 120)
                                    .overlay(Text("\(quizzes[randomInt].options[index-1])").font(.system(size: 30, weight: .bold)).foregroundColor(.black))
                            }
                        }
                    }
                } else {
                        AnswerSheetView(questionNum: randomInt, isCorrect: $isAnswer, isPresented: $btnclick)
                }
            }.frame(width: geo.size.width, height: geo.size.height)
        }
    }

    private func checkAnswer(index: Int) {
        if quizzes[randomInt].answer == index-1 {
            isAnswer = true
            gameState.decreaseBossHealth()
        } else {
            isAnswer = false
            gameState.decreaseLives()
        }
        btnclick = true
    }
}

//
//struct QuizView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuizView(isPresented: .constant(true))
//
//    }
//}

