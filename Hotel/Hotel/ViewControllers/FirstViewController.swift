//
//  FirstViewController.swift
//  Hotel
//
//  Created by Kamil Vakhobov on 20.09.23.
//

import UIKit
import Combine
import SnapKit

typealias TopCollectionView = BasicCollectionViewCell<CollectionView>

class FirstViewController: BasicViewController {
    
    let viewModel: FirstControllerViewModel

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.dataSource = self
        collectionView.register(
            TopCollectionView.self,
            forCellWithReuseIdentifier: String(describing: TopCollectionView.self)
        )
        return collectionView
    }()
    
    private lazy var emptyLabel: BasicLabel = {
        let label = BasicLabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getInfo()
        
    }
    
    init(_ viewModel: FirstControllerViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func makeLayout() {
        super.makeLayout()
        view.addSubview(collectionView)
        view.addSubview(emptyLabel)
    }
    
    override func makeConstraints() {
        super.makeConstraints()
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(-5)
            make.leading.trailing.equalToSuperview()
        }
        
        emptyLabel.snp.makeConstraints { make in
            make.center.leading.trailing.equalToSuperview()
        }
        
    }
    
    override func binding() {
        super.binding()
        viewModel.$images
            .receive(on: DispatchQueue.main)
            .sink { [weak self] info in
                self?.collectionView.reloadData()
                self?.emptyLabel.isHidden = !info.isEmpty
            }
            .store(in: &cancellables)
    }


}

extension FirstViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TopCollectionView.self), for: indexPath)
        guard let newCell = cell as? TopCollectionView else { return UICollectionViewCell()}
        newCell.builtIn.setViewModel(viewModel.images[indexPath.row])
        return newCell
    }
    
    
}
