//
//  ListScreenModels.swift
//  AholdDelhaizeTestProject
//

import UIKit

enum ListScreen {
    
    enum UseCase {
        struct Request {
        }
        struct Response {
            var items = [CollectionDomain]()
            var errorString = ""
        }
        struct ViewModel {
            var items = [CollectionUI]()
            var errorString = ""
        }
    }
}
