//
//  ArticleDetailsViewController.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 30/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation
import UIKit

class ArticleDetailsViewController: UIViewController {

    // MARK: Properties
   var presenter: ArticleDetailsPresentation?
   var article:Article?

    // MARK: Lifecycle
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      if let article = self.article {
         configure(with: article)
      }
   }
   
   private func configure(with article: Article) {
      
   }
}

extension ArticleDetailsViewController: ArticleDetailsView {
    // TODO: implement view output methods
}
