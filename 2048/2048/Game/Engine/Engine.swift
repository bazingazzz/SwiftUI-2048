
//游戏数据的别名（矩阵=一个二维数组）
typealias Matrix = [[Int]]

//方向操作的枚举
enum Direction {
    case right
    case up
    case left
    case down
}

//协议 engine
protocol Engine {
    //用 _ 表示不使用参数标签。
    //随机添加数字（输入目前的数据，返回新的数据和加了的数字）
    func addNumber(_ board: Matrix) -> (newBoard: Matrix, addedTile: (Int, Int)?)
    //滑动（输入目前的数据和方向，返回新的数据和总分）
    func push(_ board: Matrix, to direction: Direction) -> (newBoard: Matrix, scoredPoints: Int)
    //是否游戏结束（输入目前的数据，返回是否游戏结束）
    func isGameOver(_ board: Matrix) -> Bool
    //空的游戏界面（变量，当前游戏数据）
    var blankBoard: Matrix { get }
}
