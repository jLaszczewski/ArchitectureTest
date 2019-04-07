//
//  AppCoordinator.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    enum ChildCoordinator {
        case authorization
    }
    var childrenCoordinators: [ChildCoordinator: CoordinatorProtocol] = [:]
    
    override func start() {
        let authorizationC = GreetingsCoordinator(presentation: presentation)
        authorizationC.coordinator = self
        childrenCoordinators[.authorization] = authorizationC
        authorizationC.start()
    }
}

extension AppCoordinator: Finishable {
    func finish(coordinator: Coordinator?) {
        switch coordinator {
        case is GreetingsCoordinator:
            childrenCoordinators[.authorization] = nil
        default:
            break
        }
    }
}
