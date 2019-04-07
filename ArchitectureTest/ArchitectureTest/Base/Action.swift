//
//  Action.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import Foundation

struct Action<T> {
    private let action: (T) -> Void
    
    init(action: @escaping (T) -> Void) {
        self.action = action
    }
    
    func perform(param: T) {
        action(param)
    }
}
