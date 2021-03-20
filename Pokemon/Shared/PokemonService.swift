import Foundation
import RxSwift
import RxCocoa

typealias PokemonResponse = [PokemonModel]

protocol PokemonServiceProtocol {
    func excute() -> Single<PokemonResponse>
}

class PokemonService: PokemonServiceProtocol {
    func excute() -> Single<PokemonResponse> {
        Single.create { (single) in
            
            guard let path = Bundle.main.path(forResource: "pokedex", ofType: "json") else {
                single(.failure(CustomError.error(message: "not found file")))
                return Disposables.create()
            }
            let url = URL(fileURLWithPath: path)
            
            do {
                let data = try Data(contentsOf: url)
                let pokemons = try JSONDecoder().decode(PokemonResponse.self, from: data)
                single(.success(pokemons))
            } catch {
                single(.failure(CustomError.error(message: "decoding error")))
            }
            
            return Disposables.create()
        }
    }
}


