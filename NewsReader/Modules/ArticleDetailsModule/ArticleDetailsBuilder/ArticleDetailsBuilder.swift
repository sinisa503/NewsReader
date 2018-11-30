//
//  ArticleDetailsBuilder.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 30/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation

struct ArticleDetailsBuilder {
 
   static func setupModule(with article:Article) -> ArticleDetailsViewController {
      let viewController = ArticleDetailsViewController()
      let presenter = ArticleDetailsPresenter()
      let router = ArticleDetailsRouter()
      let interactor = ArticleDetailsInteractor()
      
      viewController.presenter =  presenter
      viewController.article = article
      
      presenter.view = viewController
      presenter.router = router
      presenter.interactor = interactor
      
      router.view = viewController
      
      interactor.output = presenter
      
      return viewController
   }
}
