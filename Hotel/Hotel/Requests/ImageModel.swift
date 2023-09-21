//
//  ImageModel.swift
//  Hotel
//
//  Created by Kamil Vakhobov on 20.09.23.
//

import Foundation

struct Information: Decodable {
    let image: [String]
    
    enum CodingKeys: String, CodingKey {
        case image = "image_urls"
    }
}
