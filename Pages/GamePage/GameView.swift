import SwiftUI
import AVFoundation

struct GameView: View {
    @EnvironmentObject var gameState: GameState
    @State var player: AVAudioPlayer?
    
    var body: some View {
        Group {
            if gameState.isRoundEnd {
                roundEndView
            } else if gameState.isGameWon {
                endingView
            } else {
                gameContentView
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // 라운드 종료 화면
    private var roundEndView: some View {
        RoundEndView()
            .onAppear {
                player?.stop()
            }
    }
    
    // 게임 종료 화면
    private var endingView: some View {
        EndingView()
            .onAppear {
                player?.stop()
            }
    }
    
    // 게임 내용 화면
    private var gameContentView: some View {
        VStack {
            Spacer().frame(height: 1) // 안전 영역 무시하지 않기 위한 스페이서
            TopPanelView()
            ProgressBar()
            BossView()
            CardFlipView()
        }
        .onAppear {
            playBackgroundMusic()
        }
        .background(
            Image("background_\(gameState.currentBossIndex)")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
        )
    }
    
    // 배경 음악 재생
    private func playBackgroundMusic() {
        guard let path = Bundle.main.path(forResource: "\(gameState.currentBossIndex)", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("error")
        }
        player?.play()
    }
}
