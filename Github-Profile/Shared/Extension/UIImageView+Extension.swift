//
//  UIImageView+Extension.swift
//  Github-Profile
//
//  Created by Krishantha on 06/04/2021.
//

import Foundation
import UIKit

fileprivate let cache = URLCache.shared

extension UIImageView {
    func load(url: String, placeHolderImage: UIImage?) {
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        
        let request = URLRequest(url: imageUrl)
        
        if let cachedImageData = cache.cachedResponse(for: request)?.data, let image = UIImage(data: cachedImageData) {
            self.image = image
            return
        }
        
        
        self.image = placeHolderImage
        
        URLSession.shared.dataTask(with: request) { data , response , error  in
            if let data = data, let validResponse = response, let image = UIImage(data: data) {
                let cachedData = CachedURLResponse(response: validResponse, data: data)
                cache.storeCachedResponse(cachedData, for: request)
                
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }.resume()
    }
    
    func makeCirular(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
