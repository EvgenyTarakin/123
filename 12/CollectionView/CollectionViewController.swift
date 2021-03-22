//
//  CollectionViewController.swift
//  12
//
//  Created by Евгений Таракин on 29.03.2021.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let nib = UINib(nibName: CollectionViewCell.nibName(), bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: CollectionViewCell.nibName())
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.nibName(), for: indexPath) as? CollectionViewCell
        
        guard let collectionViewCell = cell else { return UICollectionViewCell() }
        
        collectionViewCell.labelCollectionViewCell.text = "\(indexPath.row) from \(indexPath.section)"
        collectionViewCell.imageCollectionViewCell.image = UIImage(named: "key")
        
        return collectionViewCell
    }
    
}


extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = view.frame.width / 3
        return CGSize(width: size, height: size)
    }

}
