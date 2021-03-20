import Foundation
import UIKit

class PokemonDetailCoordinator: BaseCoordnator {
    
    private weak var navigationController: UINavigationController?
    private var model: PokemonModel
    
    init(model: PokemonModel, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.model = model
    }
    
    override func start() {
        let viewController = PokemonDetailViewController.instantiate()
        viewController.viewModelBuilder = { [model] in
            let viewModel = PokemonDetailViewModel(input: $0, dependencies: (pokemon: model, ()))
            return viewModel
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}
