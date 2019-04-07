//
//  Label.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import UIKit

final class Label: UILabel {
    
    init(text: String? = nil, textColor: UIColor = .black, textAlignment: NSTextAlignment = .left, numberOfLines: Int = 1, fontSize: CGFloat, fontWeight: UIFont.AvenirWeight) {
        super.init(frame: CGRect.zero)
        prepareView(with: text, textColor, textAlignment, numberOfLines, fontSize, fontWeight)
    }
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        prepareView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareView()
    }
}

// MARK: - Preparation
private extension Label {
    func prepareView(with text: String? = nil, _ textColor: UIColor = .black, _ textAlignment: NSTextAlignment = .left, _ numberOfLines: Int = 1, _ fontSize: CGFloat = 15, _ fontWeight: UIFont.AvenirWeight = .book) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.font = UIFont.appFont(ofSize: fontSize, weight: fontWeight)
    }
}
