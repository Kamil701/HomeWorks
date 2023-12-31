//
//  CollectionView.swift
//  Hotel
//
//  Created by Kamil Vakhobov on 20.09.23.
//

import UIKit
import SnapKit
import Combine

class CollectionView: UIView {
    
    private lazy var imageView = BasicImage()
    
    init() {
        super.init(frame: .zero)
        makeLayout()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeLayout() {
        addSubview(imageView)
    }
    
    private func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }
    }
    
    func setViewModel(_ viewModel: ViewModel) {
        self.imageView.setViewModel(viewModel.imageView)
    }
    
}
