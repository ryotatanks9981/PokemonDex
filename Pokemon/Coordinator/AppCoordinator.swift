import Foundation
import UIKit

class AppCoordinator: BaseCoordnator {
    private var window: UIWindow
    private weak var navigationController: UINavigationController? = {
        let vc = UINavigationController()
        let navBar = vc.navigationBar
        navBar.barTintColor = .themeColor
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = false
        navBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        return vc
    }()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        
        let pokemonListCoordinator = PokemonListCoordinator(navigationController: navigationController!)
        add(pokemonListCoordinator)
        pokemonListCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
