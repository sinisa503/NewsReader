//
//  ArticlesViewController.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 29/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController {
   
   static let identifier = "ArticlesViewController"
   
   var presenter: ArticlesPresentation?
   
   @IBOutlet weak var tableView: UITableView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      configure()
      presenter?.viewDidLoad()
   }
   
   private func configure() {
      self.title = "ARTICLES".localized()
      let cellNib = UINib(nibName: ArticleTableViewCell.identifier, bundle: Bundle.main)
      tableView.register(cellNib, forCellReuseIdentifier: ArticleTableViewCell.identifier)
   }
}

extension ArticlesViewController: UITableViewDataSource {
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return presenter?.articles?.count ?? 0
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier) as? ArticleTableViewCell {
         if let article = presenter?.articles?[indexPath.row] {
            cell.configure(with: article)
         }
         return cell
      } else {
         return UITableViewCell()
      }
   }
}

extension ArticlesViewController: UITableViewDelegate {

   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      presenter?.showDetails(for: presenter?.articles?[indexPath.row])
   }
}

extension ArticlesViewController: ArticlesView {
   
   func refreshArticles() {
      tableView.reloadData()
   }
}
