import Foundation

struct PokemonModel: Codable {
    
    var imageId: String {
        NSString(format: "%03d", id) as String
    }
    
    let id: Int
    let name: Name
    let type: [String]
    let base: Status
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "type"
        case base = "base"
    }
    
    struct Name: Codable {
        let japanese: String
        
        enum CodingKeys: String, CodingKey {
            case japanese = "japanese"
        }
    }
    
    struct Status: Codable {
        let hp: Int
        let attack: Int
        let defense: Int
        let spAttack: Int
        let spDefense: Int
        let speed: Int
        
        enum CodingKeys: String, CodingKey {
            case hp = "HP"
            case attack = "Attack"
            case defense = "Defense"
            case spAttack = "Sp. Attack"
            case spDefense = "Sp. Defense"
            case speed = "Speed"
        }
    }
}

extension PokemonModel: Equatable {
    static func == (lhs: PokemonModel, rhs: PokemonModel) -> Bool {
        lhs.id == rhs.id
    }
}

extension PokemonModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
