//
//  BasicViewController.swift
//  Hotel
//
//  Created by Kamil Vakhobov on 21.09.23.
//

import UIKit
import Combine
import SnapKit

class BasicViewController: UIViewController {
    var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLayout()
        makeConstraints()
        binding()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeLayout() {}
    
    func makeConstraints() {}
    
    func binding() {}
    
}
