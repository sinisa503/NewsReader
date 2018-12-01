//
//  String+Ext.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 29/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation

extension String {
   
   func localized() -> String {
      return NSLocalizedString(self, comment: "")
   }
   
   func normalizeDate() -> String? {
      if let date = DateUtils.shared.apiDateFormatter.date(from: self) {
         return DateUtils.shared.normalizedDateFormatter.string(from: date)
      } else {
         return nil
      }
   }
}
