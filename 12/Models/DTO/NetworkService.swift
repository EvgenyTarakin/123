//
//  NetworkService.swift
//  12
//
//  Created by Евгений Таракин on 05.04.2021.
//

import Foundation
import Alamofire

struct NetworkConstants {
    struct URLString {
        static let planetsList = "https://rickandmortyapi.com/api/location"
    }
}

protocol PlanetListNetworkService {
    func getPlanetsList(page: Int, onRequestCompleted: @escaping ((PlanetsListResponseModel?, Error?) -> ()))
}


class NetworkService: PlanetListNetworkService {
    
    func getPlanetsList(page: Int, onRequestCompleted: @escaping ((PlanetsListResponseModel?, Error?) -> ())) {
        performGetRequest(urlString: NetworkConstants.URLString.planetsList + "?page=\(page)", onRequestCompleted: onRequestCompleted)
    }
    
    
    private func performGetRequest<ResponseModel: Decodable>(urlString: String, method: HTTPMethod = .get, onRequestCompleted: @escaping ((ResponseModel?, Error?)->())) {
        AF.request(urlString,
                   method: method,
                   encoding: JSONEncoding.default
        ).response { (responseData) in
            guard responseData.error == nil,
                  let data = responseData.data
            else {
                onRequestCompleted(nil, responseData.error)
                return
            }
            do {
                let decodedValue: ResponseModel = try JSONDecoder().decode(ResponseModel.self, from: data)
                onRequestCompleted(decodedValue, nil)
            }
            catch (let error) {
                print("Response parsing error: \(error.localizedDescription)")
                onRequestCompleted(nil, error)
            }
        }
        
        
    }
}
