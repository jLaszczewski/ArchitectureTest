//
//  Finishable.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import Foundation

protocol Finishable: AnyObject {
    func finish(coordinator: Coordinator?, with option: AnyHashable?)
}

extension Finishable {
    func finish(coordinator: Coordinator?, with option: AnyHashable? = nil) {
        finish(coordinator: coordinator, with: option)
    }
}
