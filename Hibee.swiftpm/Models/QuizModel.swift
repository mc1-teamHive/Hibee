
import Foundation
struct QuizModel {
    let titleQuestion : String
    let example1 : String
    let example2 : String
    let example3 : String
    let answernum : Int
    let description : String
}
var quizs : [QuizModel] = [
    QuizModel(titleQuestion: "우리팀 이름은?", example1: "팀하이브", example2: "팀 하지메", example3: "팀 하부장", answernum: 1, description: "우리팀 이름은 하이브로 6각형.. 아 모르겠고 여기서 최대한 꿀빨자라는 모토입니다."),
    QuizModel(titleQuestion: "다음 중, 하지메가 좋아하는 서핑은?", example1: "윈드서핑 ", example2: "웹서핑", example3: "카이트 서핑", answernum: 2, description: "this is AZ개그"),
    QuizModel(titleQuestion: "다음 중, 하지메가 가위바위보에서 가장 싫어하는 것은?", example1: "Rock", example2: "Caesar", example3: "Paper", answernum: 2, description: "this is AZ개그"),
    QuizModel(titleQuestion: "팀 하이브의 시그니쳐 간식은?", example1: "핫도그", example2: "도넛", example3: "아이스크림", answernum: 1, description: "그냥 핫도그가 아닌 닭가슮살"),
    QuizModel(titleQuestion: "하지메의 컴퓨터에서 끊임없이 실행 중인 것은?", example1: "GPU", example2: "chat-GPT", example3: "GPS", answernum: 2, description: "맞아여~ 우리팀 7번째 멤버"),
    QuizModel(titleQuestion: "예리미가 출연한 영화는? ", example1: "타짜-원아이드잭", example2: "타짜-신의손", example3: "타짜(2006)", answernum: 3, description:  "예리미 그 패봐봐")
]
