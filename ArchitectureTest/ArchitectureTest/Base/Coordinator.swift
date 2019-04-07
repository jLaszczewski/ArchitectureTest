//
//  Coordinator.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import UIKit

enum CoordinatorPresentation {
    case push(navigationController: NavigationController)
    case present(presentingController: UIViewController, animted: Bool)
    case window(window: UIWindow)
    case tabBar
}

protocol CoordinatorProtocol: NSObject {
    var presentation: CoordinatorPresentation { get set }
    init(presentation: CoordinatorPresentation)
    
    var baseViewController: ViewController<BaseView<ViewModel>>? { get set }
    
    func start()
    func finish(animated: Bool, _ completion: (() -> Void)?)
}

extension CoordinatorProtocol {
    func present(viewController: UIViewController) {
        switch presentation {
        case .present(let presentingController, let animated):
            guard let viewController = viewController as? ViewController<BaseView<ViewModel>> else { return }
            baseViewController = viewController
            presentingController.present(viewController, animated: animated, completion: nil)
        case .push(let navigationController):
            if let navigationControllerToPush = viewController as? NavigationController, let topViewController = navigationControllerToPush.topViewController as? ViewController<BaseView<ViewModel>> {
                baseViewController = topViewController
                navigationController.pushViewController(topViewController, animated: true)
            } else {
                guard let viewController = viewController as? ViewController<BaseView<ViewModel>> else { return }
                baseViewController = viewController
                navigationController.pushViewController(viewController, animated: true)
            }
        case .window(let window):
            window.replaceRootViewControllerWith(viewController, animated: true, completion: nil)
        case .tabBar:
            break
        }
    }
    
    func finish(animated: Bool = true, _ completion: (() -> Void)? = nil) {
        switch presentation {
        case .present:
            baseViewController?.dismiss(animated: animated, completion: { completion?() })
        case .push(let navigationController):
            navigationController.popViewController(animated: animated)
            completion?()
        default:
            break
        }
    }
}

class Coordinator: NSObject, CoordinatorProtocol {
    var presentation: CoordinatorPresentation
    
    required init(presentation: CoordinatorPresentation) {
        self.presentation = presentation
    }
    
    var baseViewController: ViewController<BaseView<ViewModel>>?
    
    func start() {
        assertionFailure("This method should be overriden")
    }
}
