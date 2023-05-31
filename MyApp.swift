import SwiftUI

@main
struct MyApp: App {
    init() {
        CustomFonts.register()
    }
    @StateObject private var gameState = GameState(bossHealth: bosses[0].maxHealth, remainingLives: 3, totalBosses: bosses.count)
    var body: some Scene {
        WindowGroup {
            LandingPageView().environmentObject(gameState)
        }
    }
}
