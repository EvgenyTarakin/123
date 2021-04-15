import UIKit
import RxSwift
import Alamofire

struct NetworkServiceConstants {
    static let planetsUrl = "https://rickandmortyapi.com/api/location?page="
}

struct RxNetworkServiceError: Error {
    var description: String?
}

class RxNetworkService {
    
    let constants = NetworkServiceConstants.self
    
    func requestPlanets(page: Int) -> Observable<LocationsResponseModel> {
        
        let url = constants.planetsUrl + "\(page)"
        
         return performRequest(url: url)
    }
    
    private func performRequest<ResponseType: Decodable>(url: String,
                                                         method: HTTPMethod = .get,
                                                         parameters: Parameters? =  nil) -> Observable<ResponseType> {
        Observable<ResponseType>.create { (observer) -> Disposable in
        
        
        let request = AF.request(url,
                   method: method,
                   parameters: parameters,
                   encoding: JSONEncoding.default)
            .validate()
            .responseData { (afDataResponse) in
                
                guard let data = afDataResponse.data,
                      afDataResponse.error == nil
                else {
                    let error = RxNetworkServiceError(description: afDataResponse.error?.errorDescription)
                    observer.onError(error)
                    return
                }
                
                do {
                    let decodedValue: ResponseType = try JSONDecoder().decode(ResponseType.self, from: data)
                    observer.onNext(decodedValue)
                    observer.onCompleted()
                }
                catch (let error) {
                    let error = RxNetworkServiceError(description: error.localizedDescription)
                    observer.onError(error)
                }
            }
            let disposable = Disposables.create {
                request.cancel()
            }
            return disposable
        }
    }
}
