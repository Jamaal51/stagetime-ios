//
//  SocialTimelineCoordinator.swift
//  stagetime-ios
//
//  Created by Jamaal Sedayao on 9/30/18.
//  Copyright © 2018 Jamaal Sedayao. All rights reserved.
//

import UIKit
import RxSwift

class SocialTimelineCoordinator: Coordinator {
    
    var rootViewController: UIViewController?

    var childCoordinators: [Coordinator] = []

    func start() -> Observable<UIViewController> {

        let socialTimelineVC = SocialTimelineViewController(nibName: "SocialTimelineViewController", bundle: nil)

        return Observable.create({ (observer) -> Disposable in
            observer.onNext(socialTimelineVC)
            observer.onCompleted()
            return Disposables.create()
        })
    }
}
