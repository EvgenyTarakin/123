//
//  PlanetCell.swift
//  12
//
//  Created by Евгений Таракин on 23.04.2021.
//

import UIKit

class PlanetCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        accessoryType = .disclosureIndicator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func prepareForReuse() {

    }
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLocationLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
}
