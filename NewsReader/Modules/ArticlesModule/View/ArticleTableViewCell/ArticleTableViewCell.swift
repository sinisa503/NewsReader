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
   
   static let identifier = "ArticleTableViewCell"
   
   override func prepareForReuse() {
      thumbnailImageView.image = nil
   }
   
   func configure(with article: Article) {
      self.titleLabel.text = article.title
      if let publishDateString = article.publishedAt {
         self.dateLabel.text = publishDateString.normalizeDate()
      }
      if let imageUrl = article.urlToImage {
         let cache = CacheService.shared
         cache.getImage(for: imageUrl) {[weak self] image in
            DispatchQueue.main.async {
               self?.thumbnailImageView.image = image == nil ? #imageLiteral(resourceName: "default_news") : image
            }
         }
      }
   }
}
