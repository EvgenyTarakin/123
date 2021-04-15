//
//  DataCell.swift
//  12
//
//  Created by Евгений Таракин on 15.04.2021.
//

import UIKit

class DataCell: UITableViewCell {

    @IBOutlet weak var labelDataCell: UILabel?
    @IBOutlet weak var dateDataCell: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        let date = Date()
//        let day = Calendar.current.component(.day, from: date)
//        let month = Calendar.current.component(.month, from: date)
//        let year = Calendar.current.component(.year, from: date)
        
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "DD.LLLL.YYYY"
        dateDataCell?.text = dataFormatter.string(from: Date())
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
