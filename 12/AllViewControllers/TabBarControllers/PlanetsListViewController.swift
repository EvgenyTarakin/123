//
//  PlanetsListViewController.swift
//  12
//
//  Created by Евгений Таракин on 05.04.2021.
//

import UIKit
import PKHUD

class PlanetsListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        HUD.registerForKeyboardNotifications()
        HUD.allowsInteraction = false
        HUD.dimsBackground = true
    }
//    
    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        DispatchQueue.main.async {
//            <#code#>
//        }
//        DispatchQueue.global().async {
//            <#code#>
//        }
//        loadPlanets()
//        let rxNetworkService = RxNetworkService()
//        let signal = rxNetworkService.requestPlanets(page: 1)
//            .do(
//                onNext: <#T##((LocationsResponseModel) throws -> Void)?##((LocationsResponseModel) throws -> Void)?##(LocationsResponseModel) throws -> Void#>,
//                afterNext: <#T##((LocationsResponseModel) throws -> Void)?##((LocationsResponseModel) throws -> Void)?##(LocationsResponseModel) throws -> Void#>,
//                onError: <#T##((Error) throws -> Void)?##((Error) throws -> Void)?##(Error) throws -> Void#>, afterError: <#T##((Error) throws -> Void)?##((Error) throws -> Void)?##(Error) throws -> Void#>,
//                onCompleted: <#T##(() throws -> Void)?##(() throws -> Void)?##() throws -> Void#>,
//                afterCompleted: <#T##(() throws -> Void)?##(() throws -> Void)?##() throws -> Void#>,
//                onSubscribe: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>,
//                onSubscribed: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>,
//                onDispose: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
//
//        signal
//            .subscribe()
//            .disposed(by: disposeBag)
    }
    
    func loadPlanets() {
        HUD.show(.progress)
        networkService.getPlanetsList(page: 1) { [weak self] (response, error) in
            HUD.hide()
            guard let self = self else { return }
            
//            self.textField.text = response?.info.next
//            print("--------RESPONSE-------")
//            print(response as Any)
//            print("-------ERROR------")
//            print(error as Any)
//            print("-----END-------")
        }
    }
    
    let networkService: PlanetListNetworkService = NetworkService()
}
