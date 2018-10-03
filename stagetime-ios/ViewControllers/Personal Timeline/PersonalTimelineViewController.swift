//
//  PersonalTimelineViewController.swift
//  stagetime-ios
//
//  Created by Jamaal Sedayao on 9/29/18.
//  Copyright © 2018 Jamaal Sedayao. All rights reserved.
//

import UIKit

class PersonalTimelineViewController: UIViewController {

    let viewModel: PersonalTimelineViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    init(viewModel: PersonalTimelineViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "PersonalTimelineViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
