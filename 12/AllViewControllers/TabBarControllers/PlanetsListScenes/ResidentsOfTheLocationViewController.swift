//
//  ResidentsOfTheLocationViewController.swift
//  12
//
//  Created by Евгений Таракин on 23.04.2021.
//

import UIKit

struct Resident {
    let imageLink: String?
    let imageUI: UIImage?
    let previewImage: UIImage?
    let name: String?
    let sex: String?
    let species: String?
}

class LocalResidentsStorage {
    static let shared = LocalResidentsStorage()
    var dictionaryCache: Dictionary<String, Resident> = [:]
}

class ResidentsOfTheLocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        residentsCollectionView.delegate = self
        residentsCollectionView.dataSource = self
        
        residentsCollectionView.register(UINib(nibName: "ResidentCell", bundle: nil), forCellWithReuseIdentifier: "ResidentCell")
        
        residentsCollectionView.collectionViewLayout = createLayout()
        
        navigationItem.title = "Жители локации: \(planetName)"
        navigationItem.backButtonTitle = " "
        
    }

    let networkService = NetworkService()
    
    var arrayResidents: [String] = []
    
    var planetName: String = ""
    
    @IBOutlet weak var residentsCollectionView: UICollectionView!

    private func createLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 20.0
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(spacing)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        section.interGroupSpacing = spacing
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension ResidentsOfTheLocationViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayResidents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResidentCell", for: indexPath) as? ResidentCell
        else { return ResidentCell() }
        
        let currentURLString = arrayResidents[indexPath.row]
        
        if let resident = LocalResidentsStorage.shared.dictionaryCache[currentURLString] {
            cell.nameLabel.text = resident.name
            cell.sexLabel.text = resident.sex
            cell.speciesLabel.text = resident.species
            cell.avatarHuman.image = resident.previewImage
        } else {
            DispatchQueue.global().async {
                self.networkService.getResident(stringURL: currentURLString) { [ weak self ] (response, error) in
                    DispatchQueue.main.async {
                        cell.nameLabel.text = response?.name
                        cell.sexLabel.text = response?.gender
                        cell.speciesLabel.text = response?.species
                    }
                    if let imageStringURL = response?.image {
                        self?.networkService.getImage(stringURL: imageStringURL) { (image, error) in
                            DispatchQueue.main.async {
                                cell.avatarHuman.image = image
                                LocalResidentsStorage.shared.dictionaryCache[currentURLString] = Resident(imageLink: response?.image, imageUI: image, previewImage: image, name: response?.name, sex: response?.gender, species: response?.species)
                            }
                        }
                    }
                }
            }
            cell.nameLabel.text = nil
            cell.sexLabel.text = nil
            cell.speciesLabel.text = nil
        }
    
        return cell
    }

}
