//
//  TabBarCoordinator.swift
//  stagetime-ios
//
//  Created by Jamaal Sedayao on 9/29/18.
//  Copyright © 2018 Jamaal Sedayao. All rights reserved.
//

import UIKit
import RxSwift

class TabBarCoordinator: Coordinator {

    var rootViewController: UIViewController?

    var childCoordinators: [Coordinator] = []

    let personalTimelineCoordinator = PersonalTimelineCoordinator()
    let socialTimelineCoordinator = SocialTimelineCoordinator()
    let exploreEventsCoordinator = ExploreEventsCoordinator()
    let profileCoordinator = ProfileCoordinator()

    let disposeBag = DisposeBag()

    func start() -> Observable<UIViewController> {

        let tabBarController = TabBarController(nibName: "TabBarController", bundle: nil)
        tabBarController.tabBar.tintColor = .blue
        tabBarController.tabBar.barTintColor = .white

        self.addChildCoordinator(personalTimelineCoordinator)
        self.addChildCoordinator(socialTimelineCoordinator)
        self.addChildCoordinator(exploreEventsCoordinator)
        self.addChildCoordinator(profileCoordinator)

        let personalObservable = personalTimelineCoordinator.start()
        let socialObservable = socialTimelineCoordinator.start()
        let exploreObservable = exploreEventsCoordinator.start()
        let profileObservable = profileCoordinator.start()

        var tabBarControllers: [UIViewController] = []

        Observable.combineLatest(personalObservable, socialObservable, exploreObservable, profileObservable)
            .map ({ (personalVC, socialVC, exploreVC, profileVC) in
                personalVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "stage-icon"), tag: 0)
                socialVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "community-icon"), tag: 1)
                exploreVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "search-icon"), tag: 2)
                profileVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "profile-icon"), tag: 2)
                tabBarControllers.append(contentsOf: [personalVC, socialVC, exploreVC, profileVC])
            })
            .subscribe()
            .disposed(by: disposeBag)

        tabBarController.viewControllers = tabBarControllers
        tabBarController.tabBar.alpha = 0.75

        return Observable.create({ (observer) -> Disposable in
            
            observer.onNext(tabBarController)
            observer.onCompleted()

            return Disposables.create()
        })
    }
}
