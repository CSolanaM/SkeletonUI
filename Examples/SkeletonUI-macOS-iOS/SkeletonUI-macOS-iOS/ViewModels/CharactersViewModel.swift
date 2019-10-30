import Combine

class CharactersViewModel: ObservableObject {
    @Published var characters = [Character]()
    private let store = CharacterStore(service: CharacterService())

    func fetchCharacters() {
        _ = store
            .fetchCharacters()
            .sink(receiveValue: { characters in
                self.characters = characters
            })
    }

    func reloadCharacters() {
        characters = []
        fetchCharacters()
    }
}
