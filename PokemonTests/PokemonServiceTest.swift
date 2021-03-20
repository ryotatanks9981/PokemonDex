import XCTest
@testable import Pokemon
import RxSwift

class PokemonServiceTest: XCTestCase {

    var pokemonService: PokemonServiceProtocol!
    private let disposeBag = DisposeBag()
    
    override func setUpWithError() throws {
        pokemonService = PokemonService()
    }
    
    func testExcute() {
        pokemonService.excute().asDriver(onErrorJustReturn: []).drive(onNext: { pokemons in
            XCTAssertNotEqual(pokemons.count, 0)
        }).disposed(by: disposeBag)
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
    }

    func testPerformanceExample() throws {
        
        self.measure {
            
        }
    }

}
