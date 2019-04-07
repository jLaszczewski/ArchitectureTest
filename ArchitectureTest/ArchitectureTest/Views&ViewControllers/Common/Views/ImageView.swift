//
//  ImageView.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import UIKit

final class ImageView: UIImageView {
    
    init(frame: CGRect = CGRect.zero, contentMode: ContentMode = .scaleToFill, image: UIImage? = nil) {
        super.init(frame: frame)
        prepareView(with: contentMode, and: image)
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
private extension ImageView {
    func prepareView(with contentMode: ContentMode = .scaleToFill, and image: UIImage? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.image = image
        self.contentMode = contentMode
    }
}
