//
//  UIWindow+Extensions.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import UIKit

extension UIWindow {
    func replaceRootViewControllerWith(_ replacementController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        rootViewController = replacementController
        makeKeyAndVisible()
        UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak self] in
            self?.rootViewController = replacementController
            self?.makeKeyAndVisible()
        }, completion: nil)
    }
}
