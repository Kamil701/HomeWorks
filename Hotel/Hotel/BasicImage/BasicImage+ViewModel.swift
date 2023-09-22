//
//  BasicImage+ViewModel.swift
//  Hotel
//
//  Created by Kamil Vakhobov on 19.09.23.
//

import UIKit
import Combine

extension BasicImage {
    final class ViewModel {
        @Published var image: UIImage?
        
        func setImages(images: [String]) {
            for image in images {
                setImageFrom(urls: image)
            }
        }
        
        func setImageFrom(urls: String) {
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                guard let urls = URL(string: urls),
                      let data = try? Data(contentsOf: urls),
                      let image = UIImage(data: data)
                else { return }
                
                self?.image = image
            }
        }
    }
}
