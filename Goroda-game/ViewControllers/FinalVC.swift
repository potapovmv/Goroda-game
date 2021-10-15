//
//  FinalVC.swift
//  Goroda-game
//
//  Created by Admin1 on 02.09.2021.
//  Copyright © 2021 PotapovMV. All rights reserved.
//

import UIKit

class FinalVC: UIViewController {

    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var finishGameButtonOutlet: UIButton!
    
    @IBOutlet weak var finishGameImage: UIImageView!
    
    let image = UIImage(named: "city")
    
    var playerPoints = 0
    var city: [String] = []
    var animationStarted = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finishGameButtonOutlet.layer.cornerRadius = 10
        playerLabel.text = "\(playerPoints)"
        cityLabel.text = "\(city.count)"
        finishGameImage.image = image
        animation()
    }
    
    @IBAction func finishGameButton(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let startVC = mainStoryboard.instantiateViewController(withIdentifier: "StartVC") as? StartVC else { return }
        startVC.modalPresentationStyle = .fullScreen
        show(startVC, sender: nil)
    }
    
    private func animation(){
        UILabel.animate(withDuration: 1,
                        delay: 0,
                        options: .autoreverse,
                        animations: {
                            if !self.animationStarted{
                               self.cityLabel.frame.origin.x -= 100
                                self.animationStarted.toggle()
                            }
        })
    }
}
