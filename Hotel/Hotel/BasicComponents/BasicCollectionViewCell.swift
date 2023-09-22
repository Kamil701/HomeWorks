//
//  BasicCollectionViewCell.swift
//  Hotel
//
//  Created by Kamil Vakhobov on 20.09.23.
//

import UIKit
import SnapKit

class BasicCollectionViewCell<T: UIView>: UICollectionViewCell {
    let builtIn = T()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        makeLayout()
        makeConstraints()
    }
    
    private func makeLayout() {
        self.contentView.addSubview(builtIn)
    }
    
    private func makeConstraints() {
        builtIn.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    
}
