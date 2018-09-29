//
//  AppCoordinator.swift
//  stagetime-ios
//
//  Created by Jamaal Sedayao on 9/29/18.
//  Copyright © 2018 Jamaal Sedayao. All rights reserved.
//

import UIKit
import RxSwift

class AppCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []

    var window: UIWindow?

    private lazy var appNavigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = false
        return navigationController
    }()

    var rootViewController: UIViewController? {
        didSet {
            self.window?.rootViewController = rootViewController
        }
    }

    let disposeBag = DisposeBag()

    //init with an AppConfiguration - persistance, encoder/decoder, networking
    init(window: UIWindow) {
        self.window = window
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = appNavigationController
    }

    func start() {

        // if has no account, launch onboarding here

        // else if has account, but not authenticated

        // else if has account and authenticated then launch tab bar coordinator
        //launchPersonalTimeline()
        launchAppDashboard()
    }

    func launchPersonalTimeline() {

        self.rootViewController = appNavigationController

        let personalTimelineCoordinator = PersonalTimelineCoordinator()

        self.childCoordinators.append(personalTimelineCoordinator)
        
        personalTimelineCoordinator
            .start()
            .subscribe(onNext: { personalTimeVC in
                if let navigationVC = self.rootViewController as? UINavigationController {
                    navigationVC.pushViewController(personalTimeVC, animated: true)
                }
            }).disposed(by: disposeBag)
    }

    func launchAppDashboard() {

        self.rootViewController = appNavigationController

        let tabsCoordinator = TabBarCoordinator()

        tabsCoordinator
            .start()
            .map({ $0 as? UITabBarController })
            .subscribe(onNext: { tabBarController in
                if let navigationVC = self.rootViewController as? UINavigationController {
                    navigationVC.pushViewController(tabBarController!, animated: true)
                }
            })
            .disposed(by: disposeBag )

    }

}
