//
//  CollectionView+ViewModel.swift
//  Hotel
//
//  Created by Kamil Vakhobov on 20.09.23.
//

import UIKit

extension CollectionView {
    final class ViewModel {
        let imageView = BasicImage.ViewModel()
        
        init(_ image: String) {
            self.imageView.setImageFrom(urls: image)
        }
        
    }
}
