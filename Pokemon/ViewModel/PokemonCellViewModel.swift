import Foundation

protocol PokemonCellVMProtocol {
    var imageName: String { get }
    var name: String { get }
}

struct PokemonCellViewModel: PokemonCellVMProtocol {
    var imageName: String
    var name: String
}

extension PokemonCellViewModel {
    init(usingModel model: PokemonModel) {
        imageName = model.imageId
        name = model.name.japanese
    }
}

extension PokemonCellViewModel: Equatable {
    static func == (lhs: PokemonCellViewModel, rhs: PokemonCellViewModel) -> Bool {
        lhs.name == rhs.name
    }
}

extension PokemonCellViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
