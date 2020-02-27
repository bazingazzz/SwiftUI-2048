import UIKit

//控制app的生命周期
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
//AppDelegate类中默认带有如下几个方法：
    
//    1.应用程序第一次运行时执行
//    这个方法只有在App第一次运行的时候被执行过一次，每次App从后台激活时都不会再执行该方法。
//    （注：所有一般我们都在这里获取用户许可，比如本地消息推送的许可等）
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
//    2.应用程序挂起时执行
//    当有电话进来或者锁屏时，应用程序便会挂起。

//    func applicationWillResignActive(application: UIApplication)
    
//    3.应用程序进入后台时执行
//
//    func applicationDidEnterBackground(application: UIApplication)
//
//    4.应用程序将要重新回到前台时执行
//
//    func applicationWillEnterForeground(application: UIApplication)
//
//    5.应用程序重新进入活动状态时执行
//
//    func applicationDidBecomeActive(application: UIApplication)
//
//    6.应用程序将要退出时执行
//    这里通常是用来保存数据和做一些退出前的清理工作
//
//    func applicationWillTerminate(application: UIApplication)

}

