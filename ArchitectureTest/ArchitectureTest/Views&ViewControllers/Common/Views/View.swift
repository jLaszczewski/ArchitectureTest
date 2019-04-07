//
//  View.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import UIKit

final class View: UIView {
    
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
private extension View {
    func prepareView() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
