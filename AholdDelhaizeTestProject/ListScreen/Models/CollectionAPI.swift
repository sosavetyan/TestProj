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
        let collectionDomain = artObjects.compactMap({ CollectionDomain(labelText: $0.longTitle, imageURL: $0.webImage.url)})
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

struct PrincipalMakerAPI: Codable {
    let name: String
    let unFixedName: String
    let placeOfBirth: String
    let dateOfBirth: String
    let dateOfBirthPrecision: String?
    let dateOfDeath: String
    let dateOfDeathPrecision: String?
    let placeOfDeath: String
    let occupation: [String]
    let roles: [String]
    let nationality: String
    let biography: String
    let productionPlaces: [String]
    let qualification: String?
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
