import RxSwift
import RxCocoa
import RxDataSources

typealias pokemonItemsSection = SectionModel<Int, PokemonCellVMProtocol>

protocol PokemonListVMProtocol {
    typealias Input = (
        // selected pokemon
        pokemonSelected: Driver<PokemonCellViewModel>, ()
    )
    typealias Output = (
        // return [PokemonModel] of observable
        pokemons: Driver<[pokemonItemsSection]>, ()
    )
    
    typealias ViewModelBuilder = (PokemonListVMProtocol.Input) -> PokemonListVMProtocol
    
    var input: PokemonListVMProtocol.Input { get }
    var output: PokemonListVMProtocol.Output { get }
}

class PokemonListViewModel: PokemonListVMProtocol {
    var input: PokemonListVMProtocol.Input
    var output: PokemonListVMProtocol.Output
    
    typealias State = (pokemon: BehaviorRelay<PokemonModel>, ())
    let state: State = (pokemon: BehaviorRelay<PokemonModel>(value: PokemonModel(id: 0, name: .init(japanese: ""), type: [], base: .init(hp: 0, attack: 0, defense: 0, spAttack: 0, spDefense: 0, speed: 0))), ())
    
    typealias RoutingAction = (pokemonSelectedRelay: PublishRelay<PokemonModel>, ())
    private let routingAction: RoutingAction = (pokemonSelectedRelay: PublishRelay(), ())
    
    typealias Routing = (pokemonSelected: Driver<PokemonModel>, ())
    lazy var router: Routing = (pokemonSelected: routingAction.pokemonSelectedRelay.asDriver(onErrorDriveWith: .empty()), ())
    
    private let disposeBag = DisposeBag()
    
    private var pokemonService: PokemonServiceProtocol
    
    init(input: PokemonListVMProtocol.Input, pokemonService: PokemonServiceProtocol) {
        self.input = input
        self.output = PokemonListViewModel.output(input: self.input, pokemonService: pokemonService)
        self.pokemonService = pokemonService
        
        process()
    }
}

private extension PokemonListViewModel {
    static func output(input: PokemonListVMProtocol.Input, pokemonService: PokemonServiceProtocol) -> PokemonListVMProtocol.Output {
        
        let pokemons = pokemonService.excute()
            .asObservable()
            .map({ $0.sorted(by: { $0.id < $1.id }) })
            .take(10)
            .map({ $0.compactMap({ PokemonCellViewModel(usingModel: $0) }) })
            .map({ [pokemonItemsSection(model: 0, items: $0)] })
            .asDriver(onErrorJustReturn: [])
        
        return (
            pokemons: pokemons, ()
        )
    }
    
    func process() {
        self.input.pokemonSelected
            .withLatestFrom(state.pokemon.asDriver()) { ($0, $1) }
            .map({ [weak self] (str, pokemon) in
                guard let self = self else { return }
                self.pokemonService.excute().asDriver(onErrorJustReturn: []).drive(onNext: { pokemons in
                    let pokemon = pokemons.filter({ $0.name.japanese == str.name })
                    self.routingAction.pokemonSelectedRelay.accept(pokemon.first!)
                }).disposed(by: self.disposeBag)
            })
            .drive()
            .disposed(by: disposeBag)
    }
}

