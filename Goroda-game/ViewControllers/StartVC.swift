//
//  ViewController.swift
//  Goroda-game
//
//  Created by Admin1 on 23.08.2021.
//  Copyright © 2021 PotapovMV. All rights reserved.
//

import UIKit

class StartVC: UIViewController {

    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startPVPButton: UIButton!
    @IBOutlet weak var regulationsButton: UIButton!
    
    @IBOutlet weak var cityStartImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 10
        startPVPButton.layer.cornerRadius = 10
        regulationsButton.layer.cornerRadius = 10
        let image = UIImage(named: "city3")
        cityStartImage.image = image
        cityStartImage.alpha = 0.3
    }


}

