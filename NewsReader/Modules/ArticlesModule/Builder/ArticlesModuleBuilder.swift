//
//  ArticlesModuleBuilder.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 30/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation

struct ArticlesModuleBuilder {
   static func assembleModule() -> ArticlesViewController {
      
      let viewController = ArticlesViewController(nibName: ArticlesViewController.identifier, bundle: Bundle.main)
      
      let router = ArticlesRouter()
      let interactor = ArticlesInteractor()
      let presenter = ArticlesPresenter()
      
      presenter.interactor = interactor
      presenter.router = router
      presenter.view = viewController
      
      router.view = viewController
      interactor.output = presenter
      
      viewController.presenter = presenter
      
      return viewController
   }
}
