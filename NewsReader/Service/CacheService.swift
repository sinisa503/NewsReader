//
//  CacheService.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 30/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import UIKit

class CacheService {
   
   private init() {}
   static let shared = CacheService()
   
   func getImage(for url:String, completion: @escaping (UIImage?)->()) {
      if let cachedImage = getImageFromCache(for: NSString(string: url)) {
         completion(cachedImage)
      }else {
         downloadImage(from: url) {[weak self] image in
            completion(image)
            if let image = image {
               self?.cache(image: image, key: NSString(string: url))
            }
         }
      }
   }
   
   private let cache: NSCache<NSString, UIImage> = {
      let cache = NSCache<NSString, UIImage>()
      cache.countLimit = 30
      return cache
   }()
   
   private func cache(image:UIImage, key:NSString) {
      cache.setObject(image, forKey: key)
   }
   
   private func getImageFromCache(for key:NSString) -> UIImage? {
      return cache.object(forKey: key)
   }
   
   private func downloadImage(from url:String, completion: @escaping (UIImage?)->()) {
      NetworkService.shared.downloadImage(from: url) {data in
         guard let imageData = data, let image = UIImage(data: imageData) else { completion(nil); return }
         completion(image)
      }
   }
}
