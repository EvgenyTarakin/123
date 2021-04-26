//
//  AvatarCell.swift
//  12
//
//  Created by Евгений Таракин on 15.04.2021.
//

import UIKit

class AvatarCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoBackgroundImageView.alpha = 0.3
        avatarImageView.layer.cornerRadius = 74.0
        
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        
        photoBackgroundImageView.backgroundColor = DataCell().colorButton.backgroundColor
    }

    @IBOutlet weak var photoBackgroundImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
}
