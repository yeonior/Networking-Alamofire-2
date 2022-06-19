//
//  Post.swift
//  Networking-Alamofire-2
//
//  Created by Ruslan on 19.06.2022.
//

import Foundation

struct Post: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
