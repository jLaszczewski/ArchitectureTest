//
//  UIColor+LightParameters.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import UIKit

extension UIColor {
    public func darkenByPercentage(_ percentage: CGFloat) -> UIColor? {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            if percentage > 0 {
                brightness = min(brightness - percentage, 1.0)
            }
            return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
        }
        return nil
    }
    
    public func lightenByPercentage(_ percentage: CGFloat) -> UIColor? {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            if percentage > 0 {
                brightness = min(brightness + percentage, 1.0)
            }
            return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
        }
        return nil
    }
}
