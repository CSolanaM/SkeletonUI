import Combine

class CharactersViewModel: ObservableObject {
    @Published var characters = [Character]()
    private let store = CharacterStore(service: CharacterService())
    private var cancellables = Set<AnyCancellable>()

    func fetchCharacters() {
        store
            .fetchCharacters()
            .sink(receiveValue: { characters in
                self.characters = characters
            })
            .store(in: &cancellables)
    }

    func reloadCharacters() {
        characters = []
        fetchCharacters()
    }
}
