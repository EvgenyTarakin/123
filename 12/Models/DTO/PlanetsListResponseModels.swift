//
//  PlanetsListResponseModel.swift
//  12
//
//  Created by Евгений Таракин on 05.04.2021.
//

import Foundation

struct PlanetsListResponseModel: Decodable {
    let info: PlanetsListInfoResponseModel
    let results: [PlanetsListResultsResponseModel]
}

struct PlanetsListInfoResponseModel: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct PlanetsListResultsResponseModel: Decodable {
    let id: Int
    let name: String?
    let type: String?
    let residents: [String]
}

struct ResidentsListResponseModel: Decodable {
    let name: String?
    let sex: String?
    let image: URL?
}
