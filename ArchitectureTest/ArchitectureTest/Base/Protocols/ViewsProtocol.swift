//
//  ViewsProtocol.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import UIKit

protocol ViewsProtocol {
    
    var containerView: UIView { get }
    
    func add()
    func configureConstraints()
}
