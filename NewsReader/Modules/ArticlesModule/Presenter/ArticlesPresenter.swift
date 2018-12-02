//
//  ArticlesPresenter.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 30/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation

class ArticlesPresenter {
   
   var presentedArticles:[Article]? {
      didSet {
         view?.refreshTableView()
      }
   }
   
   var allArticles:[Article]? {
      didSet {
         presentedArticles = allArticles
      }
   }
   
   weak var view:ArticlesView?
   var router:ArticlesWireframe?
   var interactor:ArticlesUseCase?
   
}

extension ArticlesPresenter: ArticlesPresentation {
   
   func viewDidLoad() {
      refreshArticles(options: [:])
   }
   
   func refreshArticles(options:[String:String]) {
      self.interactor?.downloadArticles(options: options, completion: { articles in
         self.allArticles = articles
      })
   }
   
   func showDetails(for article: Article?) {
      guard let article = article else { return }
      router?.showDetails(for: article)
   }
   
   func findArticles(with text:String) {
      presentedArticles = allArticles?.filter({ article -> Bool in
         guard let title = article.title else { return false }
         return title.lowercased().contains(text.lowercased())
      })
   }
}

extension ArticlesPresenter: ArticlesInteractorOutput {
   func showErrorAlert(with title:String, and message: String) {
      view?.showErrorAlert(with: title, and: message)
   }
}
