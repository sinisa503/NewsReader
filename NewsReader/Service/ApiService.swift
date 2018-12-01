//
//  ApiService.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 30/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation
import Foundation

struct ApiService {
   
   enum Method: String {
      case get = "GET"
      case put = "PUT"
      case post = "POST"
      case delete = "DELETE"
   }
   
   static func request(for resource: Resource.Type, method: Method, parameters: [String:String]? = nil) -> URLRequest? {
      var components = URLComponents(string: "\(ApiConstant.baseUrl)/\(resource.endpoint)")
      
      var queryItems = [URLQueryItem]()
      if let parameters = parameters {
         for parameter in parameters {
            let queryItem = URLQueryItem(name: parameter.key, value: parameter.value)
            queryItems.append(queryItem)
         }
      }
      let apiQueryItem = URLQueryItem(name: ApiConstant.KEY_API_KEY, value: ApiConstant.API_KEY)
      queryItems.append(apiQueryItem)
      
      components?.queryItems = queryItems
      
      if let url = components?.url {
         var request = URLRequest(url: url)
         request.httpMethod = method.rawValue
         request.setValue(ApiConstant.KEY_JSON, forHTTPHeaderField: ApiConstant.VALUE_JSON)
         
         return request
      }
      return nil
   }
}
