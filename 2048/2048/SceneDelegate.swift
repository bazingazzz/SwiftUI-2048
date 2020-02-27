import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
   //当将场景添加到app中时scene(_:willConnectTo:options:)函数会被调用的，因此这里是配置场景的最理想地方
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let engine = GameEngine()
            let storage = LocalStorage()
            window.rootViewController = GameViewController(viewModel: GameViewModel(engine, storage: storage))
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
//    SceneDelegate 还具有下面这些函数:
//
//    sceneDidDisconnect(_:) 当场景与app断开连接是调用（注意，以后它可能被重新连接）
//    sceneDidBecomeActive(_:) 当用户开始与场景进行交互（例如从应用切换器中选择场景）时，会调用
//    sceneWillResignActive(_:) 当用户停止与场景交互（例如通过切换器切换到另一个场景）时调用
//    sceneWillEnterForeground(_:) 当场景变成活动窗口时调用，即从后台状态变成开始或恢复状态
//    sceneDidEnterBackground(_:) 当场景进入后台时调用，即该应用已最小化但仍存活在后台中
    
//    在iOS13中AppDelegate中有两个管理Senen Session的代理函数。在您的应用创建scene（场景）后，“scene session”对象将跟踪与该场景相关的所有信息。
//
//    这两个函数是:
//
//    application(_:configurationForConnecting:options:), 会返回一个创建场景时需要的UISceneConfiguration对象
//
//    application(_:didDiscardSceneSessions:), 当用户通过“应用切换器”关闭一个或多个场景时会被调用
//
//    目前，SceneSession被用于指定场景，例如“外部显示” 或“ CarPlay” 。 它还可用于还原场景的状态，如果您想使用【状态还原】，SceneSession将非常有用。 状态还原允许您在应用启动之间保留并重新创建UI。 您还可以将用户信息存储到场景会话中，它是一个可以放入任何内容的字典。
//
//    application(_:didDiscardSceneSessions:)很简单。 当用户通过“应用程序切换器”关闭一个或多个场景时，即会调用该方法。 您可以在该函数中销毁场景所使用的资源，因为不会再需要它们。
//
//    了解application(_:didDiscardSceneSessions:)与sceneDidDisconnect（_ :)的区别很重要，后者仅在场景断开连接时调用，不会被丢弃，它可能会重新连接。而application（_：didDiscardSceneSessions：）发生在使用【应用程序切换器】退出场景时。



}

//在iOS 13（及以后版本）上，SceneDelegate将负责AppDelegate的某些功能。 最重要的是，window（窗口）的概念已被scene（场景）的概念所代替。 一个应用程序可以具有不止一个场景，而一个场景现在可以作为您应用程序的用户界面和内容的载体（背景）。

