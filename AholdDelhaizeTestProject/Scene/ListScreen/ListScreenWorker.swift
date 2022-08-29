//
//  ListScreenWorker.swift
//  AholdDelhaizeTestProject
//

import UIKit

typealias SuccessGetItems  = (_ items: CollectionAPI) -> Void
typealias FailureHandler = (_ error: APIError) -> Void

class ListScreenWorker {
    
    let client: APIRequestItems
    
    init() {
        client = APIClient()
    }
    
    func getItems(_ success: @escaping SuccessGetItems, _ failure: @escaping FailureHandler) {
        let request = APIRequest(method: .get, path: AppConstants.Urls.collectionTail   , baseUrl: AppConstants.Urls.baseUrl)
        
        request.queryItems =  [URLQueryItem(name: "key", value: AppConstants.Keys.APIkey),
                               URLQueryItem(name: "involvedMaker", value: "Rembrandt+van+Rijn") ]
        
        
        client.perform(request) { (response) in
            switch response {
            case .success(let responseValue):
                
                guard let items = try? responseValue.decode(to: CollectionAPI.self) else {failure(APIError.decodingFailure); return}
                success(items.body)
                
            case .failure( let error):
                print("Error perform network request")
                failure(error.body)
            }
        }
        
    }
    
}
