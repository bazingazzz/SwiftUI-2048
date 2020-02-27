import SwiftUI

//版
struct Board: View {
    //矩阵
    var board: Matrix
    //定位的格子
    var addedTile: (Int, Int)? = nil
    
    //该格子是否有加入
    private func wasAdded(row: Int, column: Int) -> Bool {
        addedTile?.0 == row && addedTile?.1 == column
    }
    
    var body: some View {
        VStack {
            ForEach(0..<self.board.count, id: \.self) { row in
                HStack {
                    ForEach(0..<self.board[row].count, id: \.self) { column in
                        return Tile(self.board[row, column], wasAdded: self.wasAdded(row: row, column: column))
                    }
                    //四边等宽
//                    .padding(1)
                }
//                .padding(.vertical, 4)
                  .padding(4)
            }
        }
//        .padding(.vertical, 4)
//        .padding(.horizontal, 8)
        .padding(8)
        .background(Color.boardBackground)
        .cornerRadius(16)
    }
}

#if DEBUG
struct Board_Previews: PreviewProvider {
    static var previews: some View {
        Board(board: GameEngine().blankBoard)
    }
}
#endif
