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
   
   func normalizeHowOld() -> String? {
      if let date = DateUtils.shared.apiDateFormatter.date(from: self) {
         var string = ""
         let calendar = Calendar(identifier: .gregorian)
         let components = calendar.dateComponents([.day, .hour, .minute], from: date)
         if let day = components.day {
            string.append(contentsOf: "\(day <= 0 ? "" : "\(day) d ")")
         }
         if let hour = components.hour {
            string.append(contentsOf: "\(hour <= 0 ? "" : "\(hour) h ")")
         }
         if let minute = components.minute {
            string.append(contentsOf: "\(minute <= 0 ? "" : "\(minute) m")")
         }
         return string
      } else {
         return nil
      }
   }
}
