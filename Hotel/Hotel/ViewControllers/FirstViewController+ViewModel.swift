//
//  FirstViewController+ViewModel.swift
//  Hotel
//
//  Created by Kamil Vakhobov on 20.09.23.
//

import Foundation

extension FirstViewController {
    final class FirstControllerViewModel {
        @Published var images: [CollectionView.ViewModel] = []
        
        let emptyLabelVM = BasicLabel.ViewModel()
        
        init() {
            emptyLabelVM.text = "К сожалению данных ещё нет"
        }
        
        func getInfo() {
            NetworkManager().getNews { [weak self] info in
                let images = info.image
                
                images.forEach { image in
                    let collectionVM = CollectionView.ViewModel(images)
                    self?.images.append(collectionVM)
                }
            }
        }
    }
}
