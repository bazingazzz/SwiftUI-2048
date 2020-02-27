import UIKit

class Swipe: UISwipeGestureRecognizer {
    //目标
    private var target: InvokeTarget

    //初始化函数
    init(_ direction: Direction, action: @escaping () -> ()) {
        self.target = InvokeTarget(action: action)
        //避免内存泄露
        super.init(target: target, action: #selector(target.invoke))
        self.direction = direction
    }
}

class InvokeTarget: NSObject {
    //操作
    private var action: () -> ()
    
    //初始化函数
    init(action: @escaping () -> ()) {
        self.action = action
        super.init()
    }
    
    //内存泄露
    @objc public func invoke() {
        self.action()
    }
}
