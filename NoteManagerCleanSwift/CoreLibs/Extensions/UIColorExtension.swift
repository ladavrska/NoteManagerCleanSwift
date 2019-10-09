//
//  UIColorExtension.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 08/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import UIKit

public extension UIColor {
    
    convenience init(rgba: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)) {
        self.init(red: rgba.r, green: rgba.g, blue: rgba.b, alpha: rgba.a)
    }
    
    fileprivate class func colorWith(red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) -> UIColor {
        return UIColor(rgba: (red/255.0, green/255.0, blue/255.0, opacity))
    }
    
    class func yellowGreenLight() -> UIColor {
        return self.colorWith(red: 158, green: 222, blue: 62, opacity: 1.0)
    }
    
    class func yellowGreenDark() -> UIColor {
        return self.colorWith(red: 101, green: 201, blue: 54, opacity: 1.0)
    }
}
