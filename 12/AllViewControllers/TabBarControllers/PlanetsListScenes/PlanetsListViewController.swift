//
//  PlanetsListViewController.swift
//  12
//
//  Created by Евгений Таракин on 05.04.2021.
//

import UIKit
import PKHUD


struct Planet {
    let name: String?
    let type: String?
    let residents: [String]
}

class PlanetsListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        planetsTableView.delegate = self
        planetsTableView.dataSource = self

        planetsTableView.register(UINib(nibName: "PlanetCell", bundle: nil), forCellReuseIdentifier: "PlanetCell")
        
        HUD.registerForKeyboardNotifications()
        HUD.allowsInteraction = false
        HUD.dimsBackground = true
        
        loadPlanets()
    }
  
    var tableSource: [Planet] = []
    var page: Int = 1
    
    func loadPlanets() {
        
        HUD.show(.progress)
        networkService.getPlanetsList(page: page) { [weak self] (response, error) in
            HUD.hide()
            guard let results = response?.results,
                  let self = self
            else { return }
            self.tableSource.append(contentsOf: results.map({ (planetResponse) -> Planet in
                return Planet(name: planetResponse.name, type: planetResponse.type, residents: planetResponse.residents)
            }))
            self.planetsTableView.reloadData()
            self.page += 1
        }
        
    }

    let networkService: PlanetListNetworkService = NetworkService()
    
    @IBOutlet weak var planetsTableView: UITableView!
    
    @IBAction func reloadPlanets(_ sender: Any) {
        page = 1
        tableSource = []
        loadPlanets()
    }
    
}

extension PlanetsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        58.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell") as? PlanetCell
        else { return PlanetCell() }
        cell.locationLabel.text = tableSource[indexPath.row].name
        cell.typeLocationLabel.text = tableSource[indexPath.row].type
        cell.populationLabel.text = "Население: \(tableSource[indexPath.row].residents.count)"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateViewController(identifier: "ResidentsOfTheLocationViewController") as? ResidentsOfTheLocationViewController
        else { return }
        controller.planetName = "\(tableSource[indexPath.row].name!)"
        controller.populationPlanet = tableSource[indexPath.row].residents.count
        
        controller.collectionSource.append(Resident(name: "\(tableSource[indexPath.row].residents[indexPath.row])", sex: nil, avatar: nil))
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == tableSource.count / 2 {
            DispatchQueue.global().async {
                self.networkService.getPlanetsList(page: self.page) { [weak self] (response, error) in
                    DispatchQueue.main.async {
                        guard let results = response?.results,
                              let self = self
                        else { return }
                        self.tableSource.append(contentsOf: results.map({ (planetResponse) -> Planet in
                            return Planet(name: planetResponse.name, type: planetResponse.type, residents: planetResponse.residents)
                        }))
                    }
                }
            }
            page += 1
        }
    }
    
}
