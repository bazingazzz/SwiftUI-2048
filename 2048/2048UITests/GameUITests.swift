import XCTest

//UI测试工具
class GameUITests: XCTestCase {
    let app = XCUIApplication()
    let robot = GameRobot()
    
    //初始化
    override func setUp() {
        app.launch()
        robot
        .tapMenu()
        .tapNewGame()
    }
    
    //开始是否有方块
    func test_board_starts_with_a_tile() {
        robot
        .assertHasTile()
    }
    
    //能否滑动
    func test_can_swipe_board() {
        robot
        .tapMenu()
        .assertExists("MENU")
    }
    
    //开始是否重置分数
    func test_starts_with_zero_score() {
        robot
        .assertScoreIs(0)
    }
    
    //是否正常记录分数
    func test_can_score() {
        robot
        .swipeLeft()
        .swipeRight()
        .swipeUp()
        .swipeDown()
        .swipeLeft()
        .swipeRight()
        .swipeUp()
        .swipeDown()
        .assertScoreIsGreaterThan(0)
    }
    
    //新游戏是否重置分数
    func test_when_scored_on_new_game_reset_score() {
        robot
        .swipeLeft()
        .swipeRight()
        .swipeUp()
        .swipeDown()
        .tapMenu()
        .tapNewGame()
        .assertScoreIs(0)
    }
}
