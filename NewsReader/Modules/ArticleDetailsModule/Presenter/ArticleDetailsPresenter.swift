//
//  ArticleDetailsPresenter.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 30/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation

class ArticleDetailsPresenter {

   
   
    // MARK: Properties
    weak var view: ArticleDetailsView?
    var router: ArticleDetailsWireframe?
    var interactor: ArticleDetailsUseCase?
}

extension ArticleDetailsPresenter: ArticleDetailsPresentation {
   func showWebPage(url: String?) {
      if let urlString = url, let url = URL(string: urlString) {
         router?.showWebPage(url: url)
      }else {
         view?.showErrorAlert(with: "ERROR".localized(), and: "ERROR LOADING WEB".localized())
      }
   }
}

extension ArticleDetailsPresenter: ArticleDetailsInteractorOutput {}
