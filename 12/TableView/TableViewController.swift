//
//  TableViewController.swift
//  12
//
//  Created by Евгений Таракин on 25.03.2021.
//

import UIKit

class TableViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nib = UINib.init(nibName: "TableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}


extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 2, let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            cell.imageView?.image = UIImage()
            return cell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            
            cell.iconImageView.image = UIImage(named: "key")
            cell.titleLabel.text = "\(indexPath.row + 1) in \(indexPath.section + 1)"
            cell.titleLabel.font = UIFont(name: "Arial", size: 25)
            cell.generate()
            
            return cell
        }
        
        return UITableViewCell()
    }

}

extension TableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}
