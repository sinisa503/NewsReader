//
//  Utlilities.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 30/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation

class Utils {

   private init(){}
   static let shared = Utils()
   
}

class DateUtils {

   private init(){}
   static let shared = DateUtils()
   
   let apiDateFormatter:DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
      return formatter
   }()
   
   let normalizedDateFormatter:DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateFormat = "EEEE, MMM d, yyyy"
      return formatter
   }()
}
