import SwiftUI

@main
struct MyApp: App {
    @StateObject private var gameState = GameState(bossHealth: 80, remainingLives: 3, totalBosses: 3)
    var body: some Scene {
        WindowGroup {
            LandingPageView().environmentObject(gameState)
        }
    }
}
