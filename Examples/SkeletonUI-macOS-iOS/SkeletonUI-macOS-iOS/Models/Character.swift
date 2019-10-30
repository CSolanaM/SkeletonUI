enum Status: String, Decodable {
    case Alive
    case Dead
    case unknown
}

enum Gender: String, Decodable {
    case Female
    case Male
    case Genderless
    case unknown
}

class Character: Decodable, Identifiable {
    let id: Int
    let name: String
    var status: Status
    let species: String
    let type: String
    let gender: Gender
    let image: String
}
