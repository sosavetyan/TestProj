//
//  ListScreenRouter.swift
//  AholdDelhaizeTestProject
//

import UIKit

@objc protocol ListScreenRoutingLogic {
    
}

protocol ListScreenDataPassing {
    var dataStore: ListScreenDataStore? { get }
}

class ListScreenRouter: NSObject, ListScreenRoutingLogic, ListScreenDataPassing {
    weak var viewController: ListScreenViewController?
    var dataStore: ListScreenDataStore?
    
}
