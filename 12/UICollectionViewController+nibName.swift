//
//  UICollectionViewController+nibName.swift
//  12
//
//  Created by Евгений Таракин on 29.03.2021.
//

import UIKit

extension UICollectionViewCell {
    
    static func nibName() -> String {
        
        String(describing: Self.self)
    }
    
}
