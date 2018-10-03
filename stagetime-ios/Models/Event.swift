//
//  Event.swift
//  stagetime-ios
//
//  Created by Jamaal Sedayao on 10/2/18.
//  Copyright © 2018 Jamaal Sedayao. All rights reserved.
//

import Foundation

protocol Event {
    var name: String { get set }
    var details: String { get set }
    var imageString: String { get set }
    var location: String { get set }
    var date: String { get set }
}
