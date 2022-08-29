//
//  DetailScreenRouter.swift
//  AholdDelhaizeTestProject
//

import UIKit

@objc protocol DetailScreenRoutingLogic {
    
}

protocol DetailScreenDataPassing {
    var dataStore: DetailScreenDataStore? { get }
}

class DetailScreenRouter: NSObject, DetailScreenRoutingLogic, DetailScreenDataPassing
{
    weak var viewController: DetailScreenViewController?
    var dataStore: DetailScreenDataStore?
    
}
