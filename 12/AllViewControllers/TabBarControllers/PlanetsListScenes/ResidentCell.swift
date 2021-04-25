//
//  ResidentCell.swift
//  12
//
//  Created by Евгений Таракин on 25.04.2021.
//

import UIKit

class ResidentCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
    }
    
    @IBOutlet weak var avatarHuman: UIImageView!
    @IBOutlet weak var humanLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    
}
