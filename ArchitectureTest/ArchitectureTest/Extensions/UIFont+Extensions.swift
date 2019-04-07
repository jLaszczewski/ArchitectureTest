//
//  UIFont+Extensions.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import UIKit

extension UIFont {
    enum AvenirWeight {
        case light, book, roman, medium, heavy, black, regular
    }
    
    static func appFont(ofSize size: CGFloat, weight: AvenirWeight) -> UIFont {
        let font: UIFont?
        switch weight {
        case .light:
            font = UIFont(name: "Avenir-Light", size: size)
        case .book:
            font = UIFont(name: "Avenir-Book", size: size)
        case .roman:
            font = UIFont(name: "Avenir-Roman", size: size)
        case .medium:
            font = UIFont(name: "Avenir-Medium", size: size)
        case .heavy:
            font = UIFont(name: "Avenir-Heavy", size: size)
        case .black:
            font = UIFont(name: "Avenir-Black", size: size)
        default:
            font = UIFont(name: "Avenir", size: size)
        }
        guard let avenirFont = font else { return UIFont.systemFont(ofSize: size) }
        return avenirFont
    }
}
