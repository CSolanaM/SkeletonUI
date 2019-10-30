import Foundation

class ImageViewModel: ObservableObject {
    @Published var data = Data()

    init(_ string: String?) {
        guard let string = string, let url = URL(string: string) else { return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        .resume()
    }
}
