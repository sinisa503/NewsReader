//
//  RequestResult.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 29/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation

enum RequestError<T>:Error {
   case invalidJson(for:T)
}

enum RequestResult<T:Decodable> {
   case success(T)
   case failure(Error)
}

enum Country: String {
   case usa = "us"
   case germany = "de"
   case italy = "it"
}
