//
//  ListScreenInteractor.swift
//  AholdDelhaizeTestProject
//

import UIKit

protocol ListScreenBusinessLogic {
    func getItems()
}

protocol ListScreenDataStore {
    
}

class ListScreenInteractor: ListScreenBusinessLogic, ListScreenDataStore {
    var presenter: ListScreenPresentationLogic?
    var worker: ListScreenWorker?
    private var items = [CollectionDomain]()
    private var lastItems = [CollectionDomain]()
    private var page = 0
    private var paging = PagingGenerator<CollectionDomain>(startOffset: 0, limit: 5)
    
    func getItems() {
        var response = ListScreen.UseCase.Response()
        guard items.count == 0 else {
            return
        }
        worker = ListScreenWorker()
        worker?.getItems({ [self] items in
            self.items = items.makeDomainModel()
            if self.items.count == 0 {
                lastItems = getPageItems(page: page, allItems: self.items)
                response.items = lastItems
                page += 1
            } else {
                lastItems.append(contentsOf: getPageItems(page: page, allItems: self.items))
                response.items = lastItems
            }
            self.presenter?.presentItems(response: response)
        }, { error in
            response.errorString = error.localizedDescription
            self.presenter?.presentError(response: response)
        })
    }
    
    private func getPageItems(page: Int, allItems: [CollectionDomain], maxItemsPerPage: Int = 5) -> [CollectionDomain] {
        let startIndex = Int(page * maxItemsPerPage)
        var length = max(0, allItems.count - startIndex)
        length = min(Int(maxItemsPerPage), length)

        guard length > 0 else { return [] }

        return Array(allItems[startIndex..<(startIndex + length)])
    }
}
