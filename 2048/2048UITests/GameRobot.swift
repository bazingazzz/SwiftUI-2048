import XCTest

struct GameRobot {
    let app = XCUIApplication()
    
    private var menuButton: XCUIElement? {
        app.buttons["menuButton"]
    }
    
    private var newGameButton: XCUIElement? {
        app.buttons["newGameButton"]
    }
    
    private var resetBestScoreButton: XCUIElement? {
        app.buttons["resetBestScoreButton"]
    }
    
    func swipeLeft() -> Self {
        app.swipeLeft()
        return self
    }
    
    func swipeRight() -> Self {
        app.swipeRight()
        return self
    }
    
    func swipeUp() -> Self {
        app.swipeUp()
        return self
    }
    
    func swipeDown() -> Self {
        app.swipeLeft()
        return self
    }
    
    func tapMenu() -> Self {
        menuButton?.tap()
        return self
    }
    
    //有返回值的方法未得到接收和使用时通常会出现图片中的提示
    //在正式编译中不会影响编译结果，但是也妨碍代码的美观整洁，在方法上加上“@discardableResult”就可以取消这个警告
    //还有一种取消警告的方法，不加@discardableResult直接加通配符接收方法返回值
    @discardableResult
    func tapNewGame() -> Self {
        newGameButton?.tap()
        return self
    }
    
    func tapResetBestScore() -> Self {
        resetBestScoreButton?.tap()
        return self
    }
    
    @discardableResult
    func assertExists(_ text: String) -> Self {
        XCTAssertTrue(app.staticTexts[text].exists)
        return self
    }
    
    @discardableResult
    func assertScoreIs(_ score: Int) -> Self {
        XCTAssertEqual(app.staticTexts["scoreValue"].label, "\(score)")
        return self
    }
    
    @discardableResult
    func assertScoreIsGreaterThan(_ score: Int) -> Self {
        let scoreValue = Int(app.staticTexts["scoreValue"].label) ?? 0
        XCTAssertTrue(scoreValue > score)
        return self
    }
    
    @discardableResult
    func assertHasTile() -> Self {
        let containsTwo = NSPredicate(format: "label == %@", "2")
        let containsFour = NSPredicate(format: "label == %@", "4")
        
        let twoTiles = app.staticTexts.containing(containsTwo)
        let fourTiles = app.staticTexts.containing(containsFour)
        
        let allTiles = twoTiles.allElementsBoundByIndex + fourTiles.allElementsBoundByIndex
        XCTAssertFalse(allTiles.isEmpty)
        
        return self
    }
}
