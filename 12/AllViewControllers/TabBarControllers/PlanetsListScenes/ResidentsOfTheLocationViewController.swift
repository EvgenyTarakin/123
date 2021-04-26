//
//  ResidentsOfTheLocationViewController.swift
//  12
//
//  Created by Евгений Таракин on 23.04.2021.
//

import UIKit

struct Resident {
    let name: String?
    let sex: String?
    let avatar: URL?
}

class ResidentsOfTheLocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        residentsCollectionView.delegate = self
        residentsCollectionView.dataSource = self
        
        residentsCollectionView.register(UINib(nibName: "ResidentCell", bundle: nil), forCellWithReuseIdentifier: "ResidentCell")
        
        residentsCollectionView.reloadData()
        
        navigationItem.title = "Жители локации: \(planetName)"
        navigationItem.backButtonTitle = " "
        
    }

    var planetName: String = ""
    var populationPlanet: Int = 0
    var collectionSource: [Resident] = []
    
    @IBOutlet weak var residentsCollectionView: UICollectionView!

}

extension ResidentsOfTheLocationViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        populationPlanet
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResidentCell", for: indexPath) as? ResidentCell
        else { return ResidentCell() }
//        cell.humanLabel.text = collectionSource[indexPath.row].name
        
        return cell
    }

}

