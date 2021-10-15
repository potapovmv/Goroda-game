//
//  regulationVC.swift
//  Goroda-game
//
//  Created by Admin1 on 22.09.2021.
//  Copyright © 2021 PotapovMV. All rights reserved.
//

import UIKit

class RegulationVC: UIViewController {

    @IBOutlet weak var backButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButtonOutlet.layer.cornerRadius = 10
    }
    

    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
