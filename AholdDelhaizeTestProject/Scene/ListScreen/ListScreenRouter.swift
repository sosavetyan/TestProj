//
//  ListScreenRouter.swift
//  AholdDelhaizeTestProject
//

import UIKit

@objc protocol ListScreenRoutingLogic {
    func navigateToDetails(title: String, description: String)
}

protocol ListScreenDataPassing {
    var dataStore: ListScreenDataStore? { get }
}

class ListScreenRouter: NSObject, ListScreenRoutingLogic, ListScreenDataPassing {
    weak var viewController: ListScreenViewController?
    var dataStore: ListScreenDataStore?
    
    
    func navigateToDetails(title: String, description: String) {
        let destination = DetailScreenViewController()
        destination.titleText = title
        destination.descriptionText = description
        viewController?.navigationController?.pushViewController(destination, animated: true)
    }
}
