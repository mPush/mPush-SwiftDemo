 

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, PushManagerDelegate, DeviceTokenDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        /**
        *  开启推送服务并设置推送代理以及DeviceToken获取回调代理、自定义展示页面数据
        *  pushDelegate  推送代理
        *  deviceTokenDelegate  DeviceToken获取代理，如果无需获取SDK中得DeviceToken，此项可为nil
        */
        PushManager.startPushServicePushDelegate(self, tokenDelegate: self)
        /**
        *  设置是否为调试模式 默认为不开启  enabled:YES  打开   enabled:NO 关闭
        */
        PushManager.setDebugMode(true)
        /**
        *  为设备应用设置别名
        */
        PushManager.setAlias("Alias-Testing")
        PushManager.ensureTags(["tag"])
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let viewController = ViewController()
        self.window?.rootViewController = UINavigationController(rootViewController: viewController)
        self.window?.backgroundColor = UIColor.whiteColor()
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
 
    // MARK: -PushManagerDelegate Method
    func onMessage(title: String!, content: String!, extention: [NSObject : AnyObject]!) -> Bool {
        
        print("Recvive Message : title\(title), content:\(content), extention: \(extention.description)")
        
        return true
    }
    
    
    // MARK: -DeviceTokenDelegate Method
    func didReciveDeviceToken(deviceToken: String!) {
        print("The Deice Token: \(deviceToken)")
    }

}

