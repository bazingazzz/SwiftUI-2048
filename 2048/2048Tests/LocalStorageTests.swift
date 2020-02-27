import XCTest
@testable import twozerofoureight

//本地存储测试
class LocalStorageTests: XCTestCase {
    private var storage: LocalStorage!
    
    //set
    override func setUp() {
        storage = LocalStorage()
        storage.reset()
    }
    
    //能否重置
    func test_can_reset_data() {
        storage.save(score: 10)
        storage.save(bestScore: 99)
        storage.save(board: [[1,2,3,4]])
        
        storage.reset()
        
        XCTAssertEqual(storage.board, [[]])
        XCTAssertEqual(storage.score, 0)
        XCTAssertEqual(storage.bestScore, 0)
    }
    
    //能否保存
    func test_can_save_score() {
        storage.save(score: 10)
        
        XCTAssertEqual(storage.score, 10)
    }
    
    //能否保存
    func test_can_save_best_score() {
        storage.save(bestScore: 99)
        
        XCTAssertEqual(storage.bestScore, 99)
    }
    
    //能否保存
    func test_can_save_board() {
        storage.save(board: [
            [1,2,3,4],
            [1,2,3,4],
            [1,2,3,4],
            [1,2,3,4]
        ])
        
        XCTAssertEqual(storage.board, [
            [1,2,3,4],
            [1,2,3,4],
            [1,2,3,4],
            [1,2,3,4]
        ])
    }
}
