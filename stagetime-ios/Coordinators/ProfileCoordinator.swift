//
//  ProfileCoordinator.swift
//  stagetime-ios
//
//  Created by Jamaal Sedayao on 10/2/18.
//  Copyright © 2018 Jamaal Sedayao. All rights reserved.
//

import UIKit
import RxSwift

class ProfileCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []

    var rootViewController: UIViewController?

    func start() -> Observable<UIViewController> {

        let profileVC = ProfileViewController(nibName: "ProfileViewController", bundle: nil)

        return Observable.create({ (observer) -> Disposable in
            observer.onNext(profileVC)
            observer.onCompleted()
            return Disposables.create()
        })
    }
}
