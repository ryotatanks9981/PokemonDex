import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().backItem?.title = "<"
        
        window = UIWindow(frame: UIScreen.main.bounds)
        AppCoordinator(window: window!).start()
        
        return true
    }
}

