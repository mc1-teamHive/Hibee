import SwiftUI

struct QuizView: View {
    @EnvironmentObject var gameState: GameState
    @State private var isAnswer = false
    @State private var btnclick = false
    @Binding var isPresented: Bool
    @State private var randnum = 0
    var body: some View {
        // 랜덤 정수를 생성하되 이미 사용된 문제는 제외
        let randomInt = random(except: gameState.answerarr)
        
        GeometryReader { geo in
            HStack {
                // 버튼이 클릭되지 않았을 때
                if !btnclick {
                    // 이미지 출력
                    Image("\(randomInt)").resizable().frame(width: 536, height: 750).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 80))
                    
                    // 문제의 선택지 출력
                    VStack(spacing: 72) {
                        ForEach(1...3, id: \.self) { index in
                            Button {
                                checkAnswer(index: index, questnum: randomInt)
                            } label: {
                                RoundedRectangle(cornerRadius: 100)
                                    .fill(Color.white)
                                    .frame(width: 548, height: 120)
                                    .overlay(Text("\(quizzes[randomInt].options[index - 1])").font(.system(size: 30, weight: .bold)).foregroundColor(.black))
                            }
                        }
                    }
                } else {
                    // 정답 또는 오답을 보여주는 뷰
                    AnswerSheetView(questionNum: gameState.randnum, isCorrect: $isAnswer, isPresented: $btnclick)
                }
            }.frame(width: geo.size.width, height: geo.size.height)
        }
    }
    
    // 정답을 확인하고 결과에 따라 게임 상태를 업데이트하는 함수
    private func checkAnswer(index: Int, questnum: Int) {
        if quizzes[questnum].answer == index - 1 {
            isAnswer = true
            gameState.decreaseBossHealth()
        } else {
            isAnswer = false
            gameState.decreaseLives()
        }
        gameState.randnum = questnum
        gameState.answerarr.append(questnum)
        btnclick = true
    }
    
    // 이미 사용된 문제를 제외한 랜덤 정수를 반환하는 함수
    private func random(except: [Int]) -> Int {
        var result = Int.random(in: 0..<quizzes.count)
        while except.contains(result) {
            result = Int.random(in: 0..<quizzes.count)
        }
        return result
    }
}
