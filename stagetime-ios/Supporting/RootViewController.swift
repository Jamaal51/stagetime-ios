//
//  RootViewController.swift
//  stagetime-ios
//
//  Created by Jamaal Sedayao on 9/29/18.
//  Copyright © 2018 Jamaal Sedayao. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UINavigationControllerDelegate {
    lazy var rootNavigationController: UINavigationController = {
        let viewController = UINavigationController(navigationBarClass: UINavigationBar.self, toolbarClass: nil)
        viewController.delegate = self
        viewController.view.backgroundColor = .clear
        viewController.setNavigationBarHidden(true, animated: false)
        return viewController
    }()

    override var childForStatusBarStyle: UIViewController? {
        return rootNavigationController.topViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        showInitialViewController()
    }

    private func setupNavigationController() {
        addChild(rootNavigationController)
        view.addSubview(rootNavigationController.view)
        rootNavigationController.didMove(toParent: self)
        rootNavigationController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        rootNavigationController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        rootNavigationController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        rootNavigationController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func showInitialViewController() {
        print("HERE")
    }

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        setNeedsStatusBarAppearanceUpdate()
    }
}
