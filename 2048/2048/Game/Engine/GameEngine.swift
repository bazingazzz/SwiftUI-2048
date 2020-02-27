import Foundation

//游戏引擎：关于矩阵的处理
class GameEngine: Engine {
    //初始化数据为空
    //..表示下标范围
    let blankBoard = (1...4).map { _ in [0,0,0,0] }
    //初始化分数
    private var points = 0
    //随机生成2或者4
    private var twoOrFour: Int {
        return Int.random(in: .zero...10) < 8 ? 2 : 4
    }
    
    //是否结束游戏
    //->表示函数返回的类型
    func isGameOver(_ board: Matrix) -> Bool {
        //利用board的参数是否可以combine来判断是否结束游戏
        !board.canCombineValues
    }
    
    //新增number
    func addNumber(_ board: Matrix) -> (newBoard: Matrix, addedTile: (Int, Int)?) {
        //随机选取空的一格
        let emptyTile = board.randomIndex(for: .zero)
        //新的board
        var newBoard = board
        //新增数字2或者4
        if let emptyTile = emptyTile {
            newBoard[emptyTile.row, emptyTile.column] = twoOrFour
        }
        //返回
        return (newBoard, emptyTile)
    }
    
    //滑动一行
    func slide(_ row: [Int]) -> [Int] {
        //有数字的格
        let tilesWithNumbers = row.filter { $0 > .zero }
        //没有数字的格=全部-有的
        let emptyTiles = row.count - tilesWithNumbers.count
        //往没有数字的格里添加0
        let arrayOfZeros = Array(repeating: Int.zero, count: emptyTiles)
        //返回Arrya+数字
        return arrayOfZeros + tilesWithNumbers
    }
    
    //结合一行
    func combine(_ row: [Int]) -> [Int] {
        //新的一行
        var newRow = row
        //使用for .. in ..来遍历
        //先翻转后遍历
        for column in (1...row.count - 1).reversed() {
            let prevColumn = column - 1
            //遍历每一格有相同则相加
            let left = newRow[column]
            let right = newRow[prevColumn]
            if left == right {
                newRow[column] = left + right
                newRow[prevColumn] = .zero
                points += left + right
            }
        }
        return newRow
    }
    
    //翻转
    func flip(_ board: Matrix) -> Matrix {
        board.map { $0.reversed() }
    }
    
    //旋转
    func rotate(_ board: Matrix) -> Matrix {
        //矩阵的转置
        var newBoard = blankBoard
        for row in 0..<board.count {
            for column in 0..<board[row].count {
                newBoard[row][column] = board[column][row]
            }
        }
        return newBoard
    }
    
    //操作行
    private func operateRows(_ board: Matrix) -> Matrix {
        //滑动+合并
        //board的map=矩阵的每一项的映射=row传旨进入slideandcombine
        board.map(slideAndCombine)
    }
    
    //滑动和结合
    private func slideAndCombine(_ row: [Int]) -> [Int] {
        //向左滑+结合+向右滑
        row
            |> slide
            |> combine
            |> slide
    }
    
    //操作
    func push(_ board: Matrix, to direction: Direction) -> (newBoard: Matrix, scoredPoints: Int) {
        var newBoard = board
        points = .zero
        
        //操作类型
        switch direction {
        case .right: newBoard = (board |> pushRight)
        case .up:    newBoard = (board |> pushUp)
        case .left:  newBoard = (board |> pushLeft)
        case .down:  newBoard = (board |> pushDown)
        }
        
        //返回
        return (newBoard, points)
    }
    

    //向上滑动=先rotate后再flip再向右滑后flip再rotate
    private func pushUp(_ board: Matrix) -> Matrix {
        board
            |> rotate
            |> flip
            |> operateRows
            |> flip
            |> rotate
    }
    
    //向下滑动=先rotate后向右滑后rotate
    private func pushDown(_ board: Matrix) -> Matrix {
        board
            |> rotate
            |> operateRows
            |> rotate
    }
    
    //向左滑动=先flip后向右滑后flip
    private func pushLeft(_ board: Matrix) -> Matrix {
        board
            |> flip
            |> operateRows
            |> flip
    }
    
    //向右滑
    private func pushRight(_ board: Matrix) -> Matrix {
        board
            |> operateRows
    }
}
