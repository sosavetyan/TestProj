//
//  CollectionAPI.swift
//  AholdDelhaizeTestProject
//
//  Created by Sos Avetyan on 8/17/22.
//

import Foundation

struct CollectionAPI: Codable {
    let elapsedMilliseconds: Int
    let artObjects: [ArtObjectAPI]
    
    func makeDomainModel() -> [CollectionDomain] {
        let collectionDomain = artObjects.compactMap({ CollectionDomain(labelText: $0.title, imageURL: $0.webImage.url, description: $0.longTitle)})
        return collectionDomain
    }
}

struct ArtObjectAPI: Codable {
    let links: LinksAPI
    let id: String
    let objectNumber: String
    let title: String
    let longTitle: String
    let webImage: WebImageAPI
}

struct ColorNormilizationAPI: Codable {
    let originalHex: String
    let normalizedHex: String
}

struct ColorAPI: Codable {
    let percentage: Int
    let hex: String
}

struct WebImageAPI: Codable {
    let guid: String
    let offsetPercentageX: Int
    let offsetPercentageY: Int
    let width: Int
    let height: Int
    let url: String
}

struct LinksAPI: Codable {
    let selfString: String
    let web: String
    
    enum CodingKeys: String, CodingKey {
        case selfString = "self"
        case web
    }
}
