//
//  UIImageView+Extension.swift
//  AppStoreClone
//
//  Created by Ilias Basha on 5/26/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}
