import Foundation

//游戏存储：存储在本地
class LocalStorage: Storage {
    private let scoreKey = "score"
    private let bestScoreKey = "bestScore"
    private let boardKey = "onGoingGame"
    
    //重置游戏
    func reset() {
        save(score: 0)
        save(bestScore: 0)
        save(board: [[]])
    }
    
    //获取数据
    var score: Int {
        UserDefaults().integer(forKey: scoreKey)
    }

    var bestScore: Int {
        UserDefaults().integer(forKey: bestScoreKey)
    }

    var board: [[Int]]? {
        UserDefaults().object(forKey: boardKey) as? [[Int]]
    }
    
    //保存数据
    func save(score: Int) {
        UserDefaults().set(score, forKey: scoreKey)
    }
    
    func save(bestScore: Int) {
        UserDefaults().set(bestScore, forKey: bestScoreKey)
    }

    func save(board: [[Int]]) {
        UserDefaults().set(board, forKey: boardKey)
    }
}
