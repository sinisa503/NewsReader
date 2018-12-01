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
   lazy var refreshControl:UIRefreshControl = {
      let control = UIRefreshControl()
      control.addTarget(self, action: #selector(refreshArticles), for: .valueChanged)
      return control
   }()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      setup()
      presenter?.viewDidLoad()
   }
   
   @objc func refreshArticles() {
      presenter?.refreshArticles()
   }
   
   private func setup() {
      self.title = "NEWS".localized()
      let cellNib = UINib(nibName: ArticleTableViewCell.identifier, bundle: Bundle.main)
      tableView.register(cellNib, forCellReuseIdentifier: ArticleTableViewCell.identifier)
      tableView.refreshControl = self.refreshControl
      tableView.rowHeight = 200
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
   
   func showErrorAlert(with title: String, and message: String) {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let actionOK = UIAlertAction(title: "OK".localized(), style: .default, handler: nil)
      alert.addAction(actionOK)
      self.present(alert, animated: true, completion: nil)
   }
   
   func refreshTableView() {
      tableView.reloadData()
      if tableView.refreshControl?.isRefreshing ?? false {
         tableView.refreshControl?.endRefreshing()
      }
   }
}
