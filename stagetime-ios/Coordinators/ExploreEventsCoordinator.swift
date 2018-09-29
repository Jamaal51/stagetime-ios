//
//  ExploreEventsCoordinator.swift
//  stagetime-ios
//
//  Created by Jamaal Sedayao on 10/2/18.
//  Copyright © 2018 Jamaal Sedayao. All rights reserved.
//

import UIKit
import RxSwift

class ExploreEventsCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []

    var rootViewController: UIViewController?

    func start() -> Observable<UIViewController> {

        let exploreVC = ExploreEventsViewController(nibName: "ExploreEventsViewController", bundle: nil)

        return Observable.create({ (observer) -> Disposable in
            observer.onNext(exploreVC)
            observer.onCompleted()
            return Disposables.create()
        })
    }
}
