//
//  ViewController.swift
//  Networking-Alamofire-2
//
//  Created by Ruslan on 16.06.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Subviews
    private let myImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Properties
    private let imageURL = URL(string: "https://images.unsplash.com/photo-1554960717-a66eb28aef80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2071&q=80")!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        requestImage()
    }

    // MARK: - Methods
    private func configureUI() {
        view.addSubview(myImageView)
        myImageView.center = view.center
    }
    
    private func requestImage() {
        NetworkManager.shared.downloadImage(imageURL) { [weak self] image in
            self?.myImageView.image = image
        }
    }
}

