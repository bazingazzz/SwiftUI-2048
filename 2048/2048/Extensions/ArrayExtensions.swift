import Foundation

//Array扩展
extension Array where Iterator.Element == [Int] {
    //下标
    subscript(row: Int, column: Int) -> Int {
        get {
            return self[row][column]
        }
        set {
            self[row][column] = newValue
        }
    }
    
    //是否为空
    var isMatrixEmpty: Bool {
        reduce(0) { $0 + $1.reduce(0, +) } == .zero
    }
    
    //随机给一个
    func randomIndex(for value: Int) -> (row: Int, column: Int)? {
        indexesWith(value).randomElement()
    }
    
    //索引
    private func indexesWith(_ value: Int) -> [(Int, Int)] {
        var indexes:[(Int, Int)] = []

        for row in 0..<count {
            indexes.append(contentsOf: indexesOf(row, with: value))
        }

        return indexes
    }

    //索引
    private func indexesOf(_ row: Int, with value: Int)  -> [(Int, Int)] {
        var indexes: [(Int, Int)] = []
        for column in 0..<count {
            if self[row, column] == value {
                indexes.append((row,column))
            }
        }
        return indexes
    }
    
    //矩阵是否可合并
    var canCombineValues: Bool {
        guard hasZeros == false else { return true }
        for row in 0..<count {
            for column in 0..<count {
                if canCombineItemAt(row: row, column: column) {
                    return true
                }
            }
        }
        return false
    }
    
    //是否有0
    private var hasZeros: Bool {
        joined().contains(0)
    }
    
    //是否可以合并
    func canCombineItemAt(row: Int, column: Int) -> Bool {
        let verticallyCombinable = canCombineVertically(row: row, column: column)
        let horizontallyCombinable = canCombineHorizontally(row: row, column: column)
        return verticallyCombinable || horizontallyCombinable
    }
    
    //是否能垂直合并
    private func canCombineVertically(row: Int, column: Int) -> Bool {
        row != count - 1 && self[row, column] == self[row+1,column]
    }
    
    //是否能纵向合并
    private func canCombineHorizontally(row: Int, column: Int) -> Bool {
        column != count - 1 && self[row, column] == self[row, column+1]
    }
    
    //是否相等
    func isEqual(_ matrix: [[Int]]) -> Bool {
        return elementsEqual(matrix)
    }
    
    //打印矩阵
    func toMatrix() {
        for row in 0..<count {
            print("[\(self[row])]")
        }
    }
}
