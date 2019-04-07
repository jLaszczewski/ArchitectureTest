//
//  NavigationController.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    var output = Output()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

// MARK: - Output
extension NavigationController {
    struct Output {
        var coordinator = CoordinatorOutput()
    }
    
    struct CoordinatorOutput {
        var didBackFromViewController: Action<UIViewController>?
    }
}

// MARK: - UINavigationControllerDelegate
extension NavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard output.coordinator.didBackFromViewController != nil else { return }
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(fromViewController) else {
            return
        }
        output.coordinator.didBackFromViewController?.perform(param: fromViewController)
    }
}
