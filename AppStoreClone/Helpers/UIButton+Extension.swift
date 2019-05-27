//
//  UIButton+Extension.swift
//  AppStoreClone
//
//  Created by Ilias Basha on 5/26/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}
