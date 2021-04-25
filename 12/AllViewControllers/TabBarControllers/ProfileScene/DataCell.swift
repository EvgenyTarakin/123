//
//  DataCell.swift
//  12
//
//  Created by Евгений Таракин on 15.04.2021.
//

import UIKit

class DataCell: UITableViewCell {

    @IBOutlet weak var labelDataCell: UILabel!
    @IBOutlet weak var dateDataCell: UILabel!
    @IBOutlet weak var colorButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        colorButton?.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func pressColorButton(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            switch Int.random(in: 1...5) {
            case 1:
                self.colorButton?.backgroundColor = .systemPurple
//                AvatarCell().photoBackgroundImageView?.backgroundColor = .systemPurple
            case 2: self.colorButton?.backgroundColor = .systemPink
//                AvatarCell().photoBackgroundImageView?.backgroundColor = .systemPink
            case 3: self.colorButton?.backgroundColor = .systemGreen
//                AvatarCell().photoBackgroundImageView?.backgroundColor = .systemGreen
            case 4: self.colorButton?.backgroundColor = .systemBlue
//                AvatarCell().photoBackgroundImageView?.backgroundColor = .systemBlue
            default:
                self.colorButton?.backgroundColor = .systemYellow
//                AvatarCell().photoBackgroundImageView?.backgroundColor = .systemYellow
            }
            
        }
    }
}
