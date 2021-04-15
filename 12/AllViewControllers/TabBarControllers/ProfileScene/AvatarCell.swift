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
        
        fotoBackgroundImageView.alpha = 0.3
        avatarImageView.layer.cornerRadius = 74.0
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBOutlet weak var fotoBackgroundImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
}
