//
//  NetworkService.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 29/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation

enum RequestResult<T:Decodable> {
   case success(T)
   case failure(Error)
}

class NetworkService {
   
   private init() {}
   static let shared = NetworkService()
   
   func download<T:Decodable>(resource:T.Type,parametars:[String:String], completionHandler completion:@escaping (RequestResult<T>)->Void) {
      DispatchQueue.global(qos: .background).async {
         let session = URLSession(configuration: .default)
         if let request = ApiService.request(for: resource, method: .get, parameters: parametars) {
            let task = session.dataTask(with: request) { (data, response, error) in
               guard error == nil, let data = data else {
                  DispatchQueue.main.async {
                     completion(.failure(error!));
                  }
                  return
               }
               do {
                  let decoder = JSONDecoder()
                  let responseModel = try decoder.decode(T.self, from: data)
                  DispatchQueue.main.async {
                     completion(.success(responseModel))
                  }
               }catch let error {
                  DispatchQueue.main.async {
                     completion(.failure(error))
                  }
               }
            }
            task.resume()
         }
      }
   }
   
   func downloadImage(from url:String, completion: @escaping (Data?)->Void) {
      guard let url = URL(string: url) else {
         completion(nil)
         return
      }
      let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
      let session = URLSession(configuration: .default)
      let task = session.dataTask(with: request) { (data, response, error) in
         guard error == nil, data != nil else {
            completion(nil)
            return
         }
         completion(data)
      }
      task.resume()
   }
}
