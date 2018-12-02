//
//  ArticleTableViewCell.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 29/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
   
   @IBOutlet weak var titleLabel: UILabel!
   @IBOutlet weak var dateLabel: UILabel!
   @IBOutlet weak var thumbnailImageView: UIImageView!
   
   static let IDENTIFIER = "ArticleTableViewCell"
   static let ROW_HEIGHT:CGFloat = 200
   
   override func prepareForReuse() {
      thumbnailImageView.image = nil
   }
   
   func configure(with article: Article) {
      self.titleLabel.text = article.title
      if let publishDateString = article.publishedAt {
         self.dateLabel.text = publishDateString.normalizeHowOld()
      }
      if let imageUrl = article.urlToImage {
         let cache = ImageLoader.shared
         cache.loadImage(from: imageUrl) {[weak self] image in
            DispatchQueue.main.async {
               self?.thumbnailImageView.image = image == nil ? #imageLiteral(resourceName: "default_news") : image
            }
         }
      }
   }
}
