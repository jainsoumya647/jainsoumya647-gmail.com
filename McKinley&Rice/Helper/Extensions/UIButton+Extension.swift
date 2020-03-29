//
//  UIButton+Extension.swift
//  McKinley&Rice
//
//  Created by Soumya Jain on 30/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import UIKit

extension UIButton {
    
    func configureThemeButton(text: String) {
        self.setTitle(text, for: .normal)
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor.themeColor
        self.setTitleColor(.white, for: .normal)
    }
    
}
