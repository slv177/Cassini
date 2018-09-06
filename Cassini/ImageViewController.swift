//
//  ImageViewController.swift
//  Cassini
//
//  Created by SS on 6.9.18.
//  Copyright © 2018 SS. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    var imageURL: URL? {
        didSet {
            imageView.image = nil
            if view.window != nil{
                fetchImage()
            }
        }
    }
    
        private func fetchImage() {
            if let url = imageURL {
                let urlContents = try? Data(contentsOf: url)
                if let imageData = urlContents {
                    imageView.image = UIImage(data: imageData)
                }
            }
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
 
    override func viewDidLoad() {
        super .viewDidLoad()
        if imageURL == nil {
            imageURL = DemoURLs.stanford
        }
    }
    
}
    
    
    
    
    

