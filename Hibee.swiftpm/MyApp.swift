import SwiftUI

@main
struct MyApp: App {
    init() {
        CustomFonts.register()
    }
    @StateObject private var gameState = GameState(bossHealth: 100, remainingLives: 3, totalBosses: 3)
    var body: some Scene {
        WindowGroup {
            LandingPageView().environmentObject(gameState)
//            StoryView(introName: .constant("Epilogue"), finalText: .constant("제 이름은 김예림입니다."))
        }
    }
}
