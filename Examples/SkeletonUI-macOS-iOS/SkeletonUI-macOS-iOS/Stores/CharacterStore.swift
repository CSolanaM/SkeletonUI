import Combine

protocol CharacterStorable {
    func fetchCharacters() -> AnyPublisher<[Character], Never>
}

class CharacterStore: CharacterStorable {
    private let service: CharacterServiceable

    init(service: CharacterServiceable) {
        self.service = service
    }

    func fetchCharacters() -> AnyPublisher<[Character], Never> {
        service.fetchCharacters()
    }
}
