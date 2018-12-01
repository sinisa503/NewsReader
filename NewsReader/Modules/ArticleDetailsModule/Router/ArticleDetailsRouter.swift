//
//  ArticleDetailsRouter.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 30/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import UIKit

class ArticleDetailsRouter {
    weak var view: UIViewController?
}

extension ArticleDetailsRouter: ArticleDetailsWireframe {
   func showWebPage(url: URL) {
      if UIApplication.shared.canOpenURL(url) {
         UIApplication.shared.open(url, options: [:], completionHandler: nil)
      }
   }
}
