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
   
   func downloadArticles(completion: @escaping ([Article]) -> ()) {
      NetworkService.shared.download(resource: ArticlesResponseModel.self, parametars: [ApiConstant.KEY_Q:ApiConstant.VALUE_TECHNOLOGY]) { [weak self] result in
         switch result {
         case .success(let responseModel):
            completion(responseModel.articles)
         case .failure(let error):
            self?.output?.showErrorAlert(with: "ERROR".localized(), and: error.localizedDescription)
         }
      }
   }
}
