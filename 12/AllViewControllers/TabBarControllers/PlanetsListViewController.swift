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
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        DispatchQueue.main.async {
//            <#code#>
//        }
//        DispatchQueue.global().async {
//            <#code#>
//        }
//        loadPlanets()
//    }
//    
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
