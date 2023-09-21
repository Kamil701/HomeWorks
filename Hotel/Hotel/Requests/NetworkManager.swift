//
//  NetworkManager.swift
//  Hotel
//
//  Created by Kamil Vakhobov on 20.09.23.
//

import UIKit
import Moya

class NetworkManager {
    private let provider = MoyaProvider<BackenAPI>(plugins: [NetworkLoggerPlugin()])
    
    func getNews(success: ((Information)-> Void)?, error: (()-> Void)? = nil) {
        provider.request(.getImages) { result in
            switch result {
            case .success(let response):
                do {
                    let information = try JSONDecoder().decode(Information.self, from: response.data)
                    success?(information)
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
