import SwiftUI

@main
struct MyApp: App {
    @StateObject private var gameState = GameState(bossHealth: 100, remainingLives: 3)
    var body: some Scene {
        WindowGroup {
            LandingPageView().environmentObject(gameState)
        }
    }
}
