import SkeletonUI
import SwiftUI

struct CharactersView: View {
    @ObservedObject var charactersViewModel = CharactersViewModel()

    var body: some View {
        NavigationView {
            SkeletonList(with: charactersViewModel.characters, quantity: 6) { loading, character in
                CharacterView(character: character, loading: loading)
            }
            .navigationBarTitle("Characters")
            .navigationBarItems(trailing: Button(action: {
                self.charactersViewModel.reloadCharacters()
            }) {
                Text("Reload")
            })
        }
        .onAppear {
            self.charactersViewModel.fetchCharacters()
        }
    }
}

#if DEBUG
    struct CharactersView_Previews: PreviewProvider {
        static var previews: some View {
            CharactersView()
        }
    }
#endif
