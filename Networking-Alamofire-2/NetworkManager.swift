//
//  NetworkManager.swift
//  Networking-Alamofire-2
//
//  Created by Ruslan on 16.06.2022.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    typealias ImageResponse = (UIImage) -> Void
    
    // MARK: - Properties
    static let shared = NetworkManager()
    
    // MARK: - Init
    private init() {}
    
    // MARK: - Methods
    func downloadImage(_ url: URL, completion: @escaping ImageResponse) {
        AF.request(url)
            .validate()
            .downloadProgress { progress in
                print("totalUnitCount:\n", progress.totalUnitCount)
                print("completedUnitCount:\n", progress.completedUnitCount)
                print("fractionCompleted:\n", progress.fractionCompleted)
                print("localizedDescription:\n", progress.localizedDescription ?? "")
                print("---------------------------------------------")
            }
            .response { response in
                guard
                    let data = response.data,
                    let image = UIImage(data: data)
                    else { return }
                completion(image)
        }
    }
}
