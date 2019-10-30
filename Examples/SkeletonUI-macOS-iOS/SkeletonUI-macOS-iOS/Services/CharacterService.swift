import Combine
import Foundation

protocol CharacterServiceable {
    func fetchCharacters() -> AnyPublisher<[Character], Never>
}

class CharacterService: CharacterServiceable {
    func fetchCharacters() -> AnyPublisher<[Character], Never> {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/") else {
            preconditionFailure()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Response.self, decoder: JSONDecoder())
            .map { $0.results }
            .catch { _ in
                Just<[Character]>([])
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
