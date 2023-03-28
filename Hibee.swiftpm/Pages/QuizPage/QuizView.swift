import SwiftUI

struct QuizView: View {
    @Binding var cardFlip: Bool
    @State var round: Int = 1
    @State private var isAnswer = false
    @State private var btnclick = false
    let randomInt = Int.random(in: 0..<quizzes.count)

    var body: some View {
        HStack() {
            VStack() {
                Button(action: {
                    self.cardFlip.toggle()
                }) {
                    Image(systemName: "xmark.circle").resizable().frame(width: 40, height: 40).foregroundColor(.red).padding()
                }
                Spacer()
            }

            ZStack {
                RoundedRectangle(cornerRadius: 30).fill(Color.white).frame(width: 450, height: 550)
                VStack {
                    Image("Honey").resizable().frame(width: 450, height: 450)
                    Text("Round\(round)").foregroundColor(.gray)
                    Text("\(quizzes[randomInt].question)").font(.system(size: 40, weight: .semibold, design: .serif)).frame(width: 400, height: 70).minimumScaleFactor(0.5)
                }

            }.frame(alignment: .leading)

            VStack(spacing: 20) {
                ForEach(1...3, id: \.self) { index in
                    Button(action: {
                        checkAnswer(index: index)
                    }) {
                        RoundedRectangle(cornerRadius: 100)
                            .fill(Color.black.opacity(0.5))
                            .frame(width: 400, height: 100)
                            .overlay(Text("\(quizzes[randomInt].options[index-1])"))
                    }
                }
            }
        }.sheet(isPresented: $btnclick) {
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
