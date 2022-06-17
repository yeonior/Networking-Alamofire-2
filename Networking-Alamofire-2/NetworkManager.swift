//
//  NetworkManager.swift
//  Networking-Alamofire-2
//
//  Created by Ruslan on 16.06.2022.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    typealias WebServiceResponse = ([[String: String]]?, Error?) -> Void
    
    // MARK: - Properties
    static let shared = NetworkManager()
    
    // MARK: - Init
    private init() {}
    
    // MARK: - Methods
    func execute(_ url: URL, completion: @escaping WebServiceResponse) {
        
        AF.request(url).validate().responseDecodable(of: [[String: String]].self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
