//
//  TableViewCell.swift
//  12
//
//  Created by Евгений Таракин on 25.03.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func generate() {
        contentView.backgroundColor = .green
    }
    
}
