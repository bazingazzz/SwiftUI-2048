import Foundation

//Int扩展
extension Int {
    //有几位
    var digits: Int {
        String(self).count
    }
    
    //自增
    mutating func increase() {
        self += 1
    }
}
