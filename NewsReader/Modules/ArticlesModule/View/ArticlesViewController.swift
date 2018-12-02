//
//  ArticlesViewController.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 29/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController {
   
   static let IDENTIFIER = "ArticlesViewController"
   var presenter: ArticlesPresentation?
   private var searchOption: ArticleEndpoint = .allHeadlines {
      didSet {
         Settings.shared.searchEndpoint = searchOption
         switch searchOption {
         case .allHeadlines:
            presenter?.refreshArticles(options: [ApiConstant.KEY_SORT_BY:ApiConstant.VALUE_PUBLISHED_AT])
         case .topHeadlines:
            presenter?.refreshArticles(options: [ApiConstant.KEY_SORT_BY:ApiConstant.VALUE_POPULARITY])
         }
      }
   }
   lazy var refreshControl:UIRefreshControl = {
      let control = UIRefreshControl()
      control.addTarget(self, action: #selector(refreshArticles), for: .valueChanged)
      return control
   }()
   
   @IBOutlet weak var tableView: UITableView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setup()
      presenter?.viewDidLoad()
   }
   
   @objc private func refreshArticles() {
      presenter?.refreshArticles(options: [:])
   }
   
   private func setup() {
      self.title = "NEWS".localized()
      let searchTypeBarButton = UIBarButtonItem(title: "OPTIONS".localized(), style: .plain, target: self, action: #selector(setSearch))
      self.navigationItem.rightBarButtonItem = searchTypeBarButton
      
      let cellNib = UINib(nibName: ArticleTableViewCell.IDENTIFIER, bundle: Bundle.main)
      tableView.register(cellNib, forCellReuseIdentifier: ArticleTableViewCell.IDENTIFIER)
      tableView.refreshControl = self.refreshControl
      tableView.rowHeight = ArticleTableViewCell.ROW_HEIGHT
   }
   
   @objc private func setSearch() {
      let optionSheet = UIAlertController(title: "OPTIONS".localized(), message: "SELECT SEARCH OPTION".localized(), preferredStyle: .actionSheet)
      let allHeadlinesAction = UIAlertAction(title: "ALL HEADLINES".localized(), style: .default) {[weak self] _ in
         self?.searchOption = .allHeadlines
      }
      let topHeadlinesAction = UIAlertAction(title: "TOP HEADLINES".localized(), style: .default) {[weak self] _ in
         self?.searchOption = .topHeadlines
      }
      optionSheet.addAction(topHeadlinesAction)
      optionSheet.addAction(allHeadlinesAction)
      optionSheet.addAction(UIAlertAction(title: "CANCEL".localized(), style: .cancel, handler: nil))
      self.present(optionSheet, animated: true, completion: nil)
   }
}

extension ArticlesViewController: UITableViewDataSource {
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return presenter?.articles?.count ?? 0
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      if let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.IDENTIFIER) as? ArticleTableViewCell {
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
