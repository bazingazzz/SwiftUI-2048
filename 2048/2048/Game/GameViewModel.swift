import Combine
import UIKit

//针对跨越 View 层级的状态共享，它可以处理更复杂的数据类型，其引用类型的特点，也让我们需要在数据变化时通过某种手段向外发送通知
//对于“跳跃式”跨越多个 View 层级的状态，@EnvironmentObject 能让我们更方便地使用 ObservableObject，以达到简化代码的目的。
class GameViewModel: ObservableObject {
    //游戏逻辑
    private(set) var engine: Engine
    //存储
    private(set) var storage: Storage
    
    //是否游戏结束（全局变量）
    //这个类可以给不同的 View 使用，SwiftUI 会追踪使用 View 里经过 @ObservableObject 修饰过的对象里进过 @Published 修饰的属性变换，一旦发生了变换，SwiftUI 会更新相关联的 UI
    @Published var isGameOver = false
    
    //添加的砖块到页面
    private(set) var addedTile: (Int, Int)? = nil {
        //在初始化方法中设置属性不会调用 willSet 和 didSet：
        //其中willSet是值将要改变时触发，存在一个newValue的变量。didSet是值已经改变触发，存在一个oldValue的变量。
        didSet {
            //当您的UI元素影响其他内容时调用
            UIImpactFeedbackGenerator().impactOccurred() }
    }
    
    //新的分数
    private(set) var score: Int = .zero {
        didSet {
            //分数更新后
            //同步更新最高分数并保存
            bestScore = max(bestScore, score)
            storage.save(score: score)
        }
    }
    
    //新的最高分
    private(set) var bestScore: Int = .zero {
        didSet {
            //最高分数更新后
            //保存
            storage.save(bestScore: bestScore)
        }
    }
    //新的行走步数
    private(set) var numberOfMoves: Int = .zero
    
    //新的board有没有改变
    private var boardHasChanged = false
    //新的board
    private(set) var board: [[Int]] {
        //改变之前
        willSet { boardHasChanged = !board.isEqual(newValue) }
        //改变之后
        didSet {
            //游戏是否结束
            isGameOver = engine.isGameOver(board)
            //保存数据
            storage.save(board: board)
        }
    }
 
    //新的一局游戏（初始化函数）
    init(_ engine: Engine, storage: Storage) {
        self.engine = engine
        self.storage = storage
        self.score = storage.score
        self.board = storage.board ?? engine.blankBoard
        self.bestScore = max(storage.bestScore, storage.score)
    }
    
    //新增数字
    func addNumber() {
        let result = engine.addNumber(board)
        board = result.newBoard
        addedTile = result.addedTile
    }
    
    //push手势
    func push(_ direction: Direction) {
        let result = engine.push(board, to: direction)
        board = result.newBoard
        score += result.scoredPoints
        if boardHasChanged {
            addNumber()
            numberOfMoves.increase()
        }
    }
    
    //开始新的游戏
    func start() {
        if board.isMatrixEmpty { reset() }
    }
    
    //重置游戏
    func reset() {
        board = engine.blankBoard
        score = .zero
        numberOfMoves = .zero
        addNumber()
    }
    
    //去掉最高分
    func eraseBestScore() {
        bestScore = .zero
    }

}
