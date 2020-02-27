import XCTest
import SwiftUI
@testable import twozerofoureight

class GameViewControllerTests: XCTestCase {
    func test_view_controller_call_start_on_init() {
        let viewModel = GameViewModelSpy(GameEngineStub(), storage: MockStorage())
        let _ = GameViewController(viewModel: viewModel)
        
        XCTAssertTrue(viewModel.didCallStart)
    }
}

private class GameViewModelSpy: GameViewModel {
    var didCallStart = false
    
    override func start() {
        didCallStart.toggle()
    }
}
