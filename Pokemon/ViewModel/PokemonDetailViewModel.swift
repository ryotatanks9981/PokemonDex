import RxSwift
import RxCocoa

protocol PokemonDetailVMProtocol {
    typealias Input = ()
    typealias Output = (
        pokemon: Driver<PokemonModel>, ()
    )
    
    typealias Dependencies = (
        pokemon:PokemonModel, ()
    )
    
    typealias ViewModelBuilder = (PokemonDetailVMProtocol.Input) -> PokemonDetailVMProtocol
    
    var input: PokemonDetailVMProtocol.Input { get }
    var output: PokemonDetailVMProtocol.Output { get }
}

struct PokemonDetailViewModel: PokemonDetailVMProtocol {
    var input: PokemonDetailVMProtocol.Input
    var output: PokemonDetailVMProtocol.Output
    
    init(input: PokemonDetailVMProtocol.Input, dependencies: PokemonDetailVMProtocol.Dependencies) {
        self.input = input
        self.output = PokemonDetailViewModel.output(dependencies: dependencies)
    }
}

private extension PokemonDetailViewModel {
    static func output(dependencies: PokemonDetailVMProtocol.Dependencies) -> PokemonDetailVMProtocol.Output {
        let pokemon = Driver.just(dependencies.pokemon)
        return (
            pokemon: pokemon, ()
        )
    }
}
