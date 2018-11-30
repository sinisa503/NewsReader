//
//  ArticlesRouter.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 30/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import UIKit

class ArticlesRouter {
   
   weak var view: UIViewController?
}

extension ArticlesRouter: ArticlesWireframe {
   func showDetails(for article: Article) {
      let articleDetailsViewController = ArticleDetailsBuilder.setupModule(with: article)
      
      view?.showDetailViewController(articleDetailsViewController, sender: nil)
   }
}
