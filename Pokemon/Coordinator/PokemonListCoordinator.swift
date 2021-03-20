import UIKit
import RxSwift

class PokemonListCoordinator: BaseCoordnator {
    
    private weak var navigationController: UINavigationController?
    private let disposeBag = DisposeBag()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let pokemonListViewController = PokemonListViewController.instantiate()
        let pokemonService = PokemonService()
        pokemonListViewController.viewModelBuilder = { [disposeBag] in
            let viewModel = PokemonListViewModel(input: $0, pokemonService: pokemonService)
            viewModel.router.pokemonSelected.drive(onNext: { [weak self] in
                guard let self = self else { return }
                self.showPokemonDetail(usingModel: $0)
            }).disposed(by: disposeBag)
            return viewModel
        }
        navigationController?.pushViewController(pokemonListViewController, animated: true)
    }
}

private extension PokemonListCoordinator {
    func showPokemonDetail(usingModel model: PokemonModel) {
        let pokemonDetailCoordinator = PokemonDetailCoordinator(model: model, navigationController: self.navigationController!)
        add(pokemonDetailCoordinator)
        pokemonDetailCoordinator.start()
    }
}
