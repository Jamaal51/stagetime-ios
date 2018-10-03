//
//  PersonalTimelineCoordinator.swift
//  stagetime-ios
//
//  Created by Jamaal Sedayao on 9/29/18.
//  Copyright © 2018 Jamaal Sedayao. All rights reserved.
//

import UIKit
import RxSwift

class PersonalTimelineCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []

    var rootViewController: UIViewController?

    //inject viewModel with app config dependency
    let personalTimelineVM = PersonalTimelineViewModel()

    func start() -> Observable<UIViewController> {

        let personalTimelineVC = PersonalTimelineViewController(viewModel: personalTimelineVM)

        return Observable.create({ (observer) -> Disposable in
            observer.onNext(personalTimelineVC)
            observer.onCompleted()
            return Disposables.create()
        })
    }
}
