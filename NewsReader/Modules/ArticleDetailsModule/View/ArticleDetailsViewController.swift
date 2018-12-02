//
//  ArticleDetailsViewController.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 30/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
   
    // MARK: Properties
   var presenter: ArticleDetailsPresentation?
   var article:Article?
   
   //MARK: IBOutlets
   @IBOutlet weak var titleLabel: UILabel!
   @IBOutlet weak var articleImageView: UIImageView!
   @IBOutlet weak var authorLabel: UILabel!
   @IBOutlet weak var sourceLabel: UILabel!
   @IBOutlet weak var dateLabel: UILabel!
   @IBOutlet weak var contentTextView: UITextView!
   
    // MARK: Lifecycle
   override func viewDidLoad() {
      super.viewDidLoad()
      setup()
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      if let article = self.article {
         configure(with: article)
      }
   }
   
   //MARK: Private functions
   private func setup() {
      let barButtonItem = UIBarButtonItem(title: "WEB".localized() , style: .plain, target: self, action: #selector(goToWeb))
      self.navigationItem.rightBarButtonItem = barButtonItem
   }
   
   @objc func goToWeb() {
      presenter?.showWebPage(url: article?.url)
   }
   
   private func configure(with article: Article) {
      self.titleLabel.text = article.title
      self.authorLabel.text = article.author
      self.sourceLabel.text = article.source?.name
      self.dateLabel.text = article.publishedAt?.normalizeDate()
      self.contentTextView.text = article.description != nil ? article.description : article.content
      if let imageUrl = article.urlToImage {
         ImageLoader.shared.loadImage(from: imageUrl, completion: { image in
            DispatchQueue.main.async { [weak self] in
               self?.articleImageView.image = image == nil ? #imageLiteral(resourceName: "default_news") : image
            }
         })
      }
   }
}

extension ArticleDetailsViewController: ArticleDetailsView {
   func showErrorAlert(with title: String, and message: String) {
      let alert = UIAlertController()
      alert.addAction(UIAlertAction(title: title, style: .default, handler: nil))
      self.present(alert, animated: true, completion: nil)
   }
}
