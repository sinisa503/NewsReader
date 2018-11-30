//
//  ArticleDetailsPresenter.swift
//  NewsReader
//
//  Created by Sinisa Vukovic on 30/11/2018.
//  Copyright © 2018 Sinisa Vukovic. All rights reserved.
//

import Foundation

class ArticleDetailsPresenter {

    // MARK: Properties

    weak var view: ArticleDetailsView?
    var router: ArticleDetailsWireframe?
    var interactor: ArticleDetailsUseCase?
}

extension ArticleDetailsPresenter: ArticleDetailsPresentation {
    // TODO: implement presentation methods
}

extension ArticleDetailsPresenter: ArticleDetailsInteractorOutput {
    // TODO: implement interactor output methods
}
