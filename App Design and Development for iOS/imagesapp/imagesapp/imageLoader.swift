import SwiftUI
import Combine
import Foundation

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?
    private let url: URL
    var imgCache  = imageCache.getImageCache()

    init(url: URL) {
        self.url = url
    }
    deinit {
        cancellable?.cancel()
    }
    
    func load() {
        if(loadFromCache(url: url.absoluteString)){
            print("cache hit!!")
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func loadFromCache(url: String?) -> Bool{
        guard let urlString = url else{
            return false
        }
        
        guard let cachedImage = imgCache.getImage(forKey: urlString) else{
            return false
        }
        
        self.image = cachedImage
        
        return true
    }
    
    func cancel() {
        if (self.image != nil){
            print("saved to cache")
            self.imgCache.setImage(forKey: self.url.absoluteString, image: self.image!)
        }
        cancellable?.cancel()
    }
}

struct AsyncImage<Placeholder: View>: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder?
    
    init(url: URL, placeholder: Placeholder? = nil) {
        loader = ImageLoader(url: url)
        self.placeholder = placeholder
    }

    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                .resizable()
                .renderingMode(.original)
            } else {
                placeholder
            }
        }
    }
}
