//
//  ArticleDetailsContract.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 30/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation

protocol ArticleDetailsView: class {
    func showErrorAlert(with title:String, and message: String)
}

protocol ArticleDetailsPresentation: class {
   func showWebPage(url:String?)
}

protocol ArticleDetailsUseCase: class {}

protocol ArticleDetailsInteractorOutput: class {}

protocol ArticleDetailsWireframe: class {
    func showWebPage(url:URL)
}
