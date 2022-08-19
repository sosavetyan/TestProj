//
//  ListScreenPresenter.swift
//  AholdDelhaizeTestProject
//

import UIKit

protocol ListScreenPresentationLogic {
    func presentItems(response: ListScreen.UseCase.Response)
    func presentError(response: ListScreen.UseCase.Response)
}

class ListScreenPresenter: ListScreenPresentationLogic
{
    weak var viewController: ListScreenDisplayLogic?
    
    
    func presentItems(response: ListScreen.UseCase.Response) {
        var viewModel = ListScreen.UseCase.ViewModel()
        viewModel.items = response.items.compactMap({ CollectionUI(labelText: $0.labelText, imageURL: $0.imageURL)})
        viewController?.displayItems(viewMode: viewModel)
    }
    
    func presentError(response: ListScreen.UseCase.Response) {
        var viewModel = ListScreen.UseCase.ViewModel()
        viewModel.errorString = response.errorString
        viewController?.displayError(viewMode: viewModel)
    }
}
