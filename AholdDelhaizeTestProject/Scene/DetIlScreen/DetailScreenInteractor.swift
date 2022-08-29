//
//  DetailScreenInteractor.swift
//  AholdDelhaizeTestProject
//

import UIKit

protocol DetailScreenBusinessLogic {
    
}

protocol DetailScreenDataStore {
    
}

class DetailScreenInteractor: DetailScreenBusinessLogic, DetailScreenDataStore
{
    var presenter: DetailScreenPresentationLogic?
    var worker: DetailScreenWorker?
    //var name: String = ""
    
}
