struct Quiz {
    let question: String
    let options: [String]
    let answer: Int
    let description: String
}

let quizzes = [
    Quiz(question: "우리팀 이름은?", options: ["팀하이브", "팀 하지메", "팀 하부장"], answer: 0, description: "우리팀 이름은 하이브로 6각형.. 아 모르겠고 여기서 최대한 꿀빨자라는 모토입니다."),
    Quiz(question: "다음 중, 하지메가 좋아하는 서핑은?", options: ["윈드서핑", "웹서핑", "카이트 서핑"], answer: 1, description: "this is AZ개그"),
    Quiz(question: "다음 중, 하지메가 가위바위보에서 가장 싫어하는 것은?", options: ["락", "페이퍼", "'시저'"], answer: 2, description: "this is AZ개그"),
    Quiz(question: "팀 하이브의 시그니쳐 간식은?", options: ["핫도그", "도넛", "아이스크림"], answer: 0, description: "그냥 핫도그가 아닌 닭가슴살"),
    Quiz(question: "하지메의 컴퓨터에서 끊임없이 실행 중인 것은?", options: ["GPU", "Chat-GPT", "GPS"], answer: 1, description: "맞아여~ 우리팀 7번째 멤버"),
    Quiz(question: "예리미가 출연한 영화는?", options: ["타짜-원아이드잭", "타짜-신의손", "타짜(2006)"], answer: 2, description: "예리미 그 패 봐봐!")
]
