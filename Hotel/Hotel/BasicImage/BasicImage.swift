//
//  BasicImage.swift
//  Hotel
//
//  Created by Kamil Vakhobov on 19.09.23.
//

import UIKit
import Combine

class BasicImage: UIImageView {
    var cancellables: Set<AnyCancellable> = []
    
    func setViewModel(_ viewModel: ViewModel) {
        viewModel.$image
            .receive(on: DispatchQueue.main)
            .sink { [weak self] images in
            self?.image = images
        }
        .store(in: &cancellables)
    }
    
}
  

