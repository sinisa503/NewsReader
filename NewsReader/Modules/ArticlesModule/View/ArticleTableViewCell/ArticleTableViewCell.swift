//
//  ArticleTableViewCell.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 29/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
   
      @IBOutlet weak var articleTitle: UILabel!
      static let identifier = "ArticleTableViewCell"
      
      func configure(with article: Article) {
         self.articleTitle.text = article.title
      }
}
