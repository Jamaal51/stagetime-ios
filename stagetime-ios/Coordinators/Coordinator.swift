//
//  Coordinator.swift
//  stagetime-ios
//
//  Created by Jamaal Sedayao on 9/29/18.
//  Copyright © 2018 Jamaal Sedayao. All rights reserved.
//

import UIKit


protocol Coordinator: class {
    var rootViewController: UIViewController? { get }
    var childCoordinators: [Coordinator] { get set }
}

extension Coordinator {
    func addChildCoordinator(_ coordinator: Coordinator) {
        self.childCoordinators.append(coordinator)
    }

    func removeChildCoordinator(_ coordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter({ $0 !== coordinator })
    }
}
