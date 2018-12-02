//
//  ArticlesInteractor.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 30/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation

class ArticlesInteractor {
   var output:ArticlesInteractorOutput?
}

extension ArticlesInteractor: ArticlesUseCase {
   
   func downloadArticles(options:[String:String], completion: @escaping ([Article]) -> ()) {
      /**
       Additional query parametar is added "q=technology" because if searching all news
       "search is too broad" is returned from API. Because of this I added this param to search only technology news
       **/
      var dictWithAddedOptionTechnology = options
      dictWithAddedOptionTechnology.updateValue(ApiConstant.VALUE_TECHNOLOGY, forKey: ApiConstant.KEY_Q)
      
      NetworkService.shared.download(resource: ArticlesResponseModel.self, parametars: dictWithAddedOptionTechnology) { [weak self] result in
         switch result {
         case .success(let responseModel):
            completion(responseModel.articles)
         case .failure(let error):
            self?.output?.showErrorAlert(with: "ERROR".localized(), and: error.localizedDescription)
         }
      }
   }
}
