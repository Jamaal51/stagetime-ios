//
//  StageEvent.swift
//  stagetime-ios
//
//  Created by Jamaal Sedayao on 10/2/18.
//  Copyright © 2018 Jamaal Sedayao. All rights reserved.
//

import Foundation
import RxSwift

struct StageEvent: Event, Codable {
    var name: String
    var details: String
    var imageString: String
    var location: String
    var date: String

    //testing only
    func initializeModel() -> Observable<[StageEvent]> {
        return Observable.create({ (observer) -> Disposable in
            let event1 = StageEvent(name: "House Show",
                                    details: "Stand up show featuring the best up-and-coming comics in NYC",
                                    imageString: "",
                                    location: "StandUp NY",
                                    date: "Monday 9/1, 8pm")
            let event2 = StageEvent(name: "Comics Unleashed",
                                    details: "Showcase of best standups",
                                    imageString: "",
                                    location: "Broadway Comedy Club",
                                    date: "Tuesday 9/2, 9pm")
            let event3 = StageEvent(name: "Comedy Corner",
                                    details: "Funniest Stand Up comedy",
                                    imageString: "",
                                    location: "The Boom Room",
                                    date: "Wednesday 9/3, 7pm")
            let event4 = StageEvent(name: "Laugh Out Lerd",
                                    details: "Bring your funnybone",
                                    imageString: "",
                                    location: "The Pesky Bar",
                                    date: "Thursday 9/4, 945pm")
            let event5 = StageEvent(name: "Funny Or Go Home",
                                    details: "Stand ups roast each other",
                                    imageString: "",
                                    location: "The Stand",
                                    date: "Friday 9/5, 7pm")


            let eventArray = [event1, event2, event3, event4, event5]
            observer.onNext(eventArray)
            return Disposables.create()
        })
    }
}
