import SwiftUI

struct Header: View {
    let score: Int
    let bestScore: Int
    let scoreLabel = "SCORE"
    let bestScoreLabel = "BEST"
    let menuAction: () -> Void
    
    var body: some View {
        HStack(alignment: .top) {
            YellowBlock()
            HStack(alignment: .top) {
                VStack(alignment: .center, spacing: 10) {
                    ScoreBox(title: scoreLabel, score:score)
                    SmallActionButton(title: "MENU", action: self.menuAction)
                        .accessibility(identifier: "menuButton")
                }
                ScoreBox(title: bestScoreLabel, score: bestScore)
            }
        }
    }
}
struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(score: 10, bestScore:1121) {
            print("tapped on menu")
        }
    }
}
