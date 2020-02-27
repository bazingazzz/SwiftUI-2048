import SwiftUI
import Foundation

//UIHostingController为SwiftUI视图ContentView创建一个视图控制器
// 当您要将SwiftUI视图集成到UIKit视图层次结构中时，创建一个对象。在创建时，指定要用作此视图控制器的根视图的SwiftUI视图；您可以稍后使用属性更改该视图。通过将其呈现或作为子视图控制器嵌入到界面中，可以像使用其他任何视图控制器一样使用托管控制器
//

class GameViewController: UIHostingController<GameView> {
    //数据类
    private let viewModel: GameViewModel?
    
    //初始化函数
    init(viewModel: GameViewModel) {
        //设置viewmodel
        self.viewModel = viewModel
        
        //如果所有属性均已初始化，则在实例化类的时候会自动调用init()或super.init()
        super.init(rootView: GameView(viewModel: viewModel))
        
        //设置手势
        setupGestures()
        
        //开始新游戏
        viewModel.start()
    }
    
    //设置手势函数
    private func setupGestures() {
        view.addGestureRecognizer(Swipe(.left) { [weak self] in
            self?.viewModel?.push(.left)
        //重点是weak用法，弱引用。被标记了weak的对象，能让ARC在正确的时间将其合理的销毁。内存管理方面的一种方式。
        })
        view.addGestureRecognizer(Swipe(.right) { [weak self] in
            self?.viewModel?.push(.right)
        })
        view.addGestureRecognizer(Swipe(.up) { [weak self] in
            self?.viewModel?.push(.up)
        })
        view.addGestureRecognizer(Swipe(.down) { [weak self] in
            self?.viewModel?.push(.down)
        })
    }
    
    //日志函数报错
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
