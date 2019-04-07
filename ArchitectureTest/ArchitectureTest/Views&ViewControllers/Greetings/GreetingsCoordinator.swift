//
//  GreetingsCoordinator.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import UIKit

final class GreetingsCoordinator: Coordinator {
    
    weak var coordinator: Finishable?
    
    override func start() {
        let greetingsVC = GreetingsViewController()
        let greetingsVM = GreetingsViewModel()
        greetingsVC.baseView.configure(with: greetingsVM)
        present(viewController: greetingsVC)
    }
}
