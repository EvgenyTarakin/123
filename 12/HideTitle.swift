//
//  HideTitle.swift
//  12
//
//  Created by Евгений Таракин on 28.03.2021.
//

import UIKit

extension UIViewController {
    func hideTitle() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
