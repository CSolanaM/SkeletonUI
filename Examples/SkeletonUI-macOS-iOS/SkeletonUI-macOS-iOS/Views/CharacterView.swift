import SkeletonUI
import SwiftUI

struct CharacterView: View {
    @ObservedObject var imageViewModel: ImageViewModel
    let character: Character?
    let loading: Bool

    init(character: Character?, loading: Bool) {
        self.character = character
        self.loading = loading
        imageViewModel = ImageViewModel(character?.image)
    }

    var body: some View {
        HStack {
            Image(uiImage: UIImage(data: imageViewModel.data))
                .resizable()
                .skeleton(with: loading)
                .shape(type: .circle)
                .appearance(type: .gradient())
                .animation(type: .linear())
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            Text(character?.name)
                .skeleton(with: loading)
                .shape(type: .capsule)
                .multiline(lines: 3, scales: [1: 0.5, 2: 0.25], padding: EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                .appearance(type: .gradient())
                .animation(type: .linear())
        }
    }
}

#if DEBUG
    struct CharacterView_Previews: PreviewProvider {
        static var previews: some View {
            CharacterView(character: nil, loading: true).previewLayout(.sizeThatFits).frame(width: 300, height: 100, alignment: .center)
        }
    }
#endif
