//
//  gamePVPVC.swift
//  Goroda-game
//
//  Created by Admin1 on 21.09.2021.
//  Copyright © 2021 PotapovMV. All rights reserved.
//

import UIKit

class GamePVPVC: UIViewController {

     @IBOutlet weak var cityLabel: UILabel!
        @IBOutlet weak var playerLabel: UILabel!
        
        @IBOutlet weak var cityTF: UITextField!
        
        @IBOutlet weak var cityImage: UIImageView!
        
        
        @IBOutlet weak var answerButtonOutlet: UIButton!
        @IBOutlet weak var finishButtomOutlet: UIButton!
        
        var city = DataManager()
        var player = 0
        var playersPoints: [Int] = []
        var points = 0
        var players: [String] = []
        var gameOverCity: [String] = []
        var cityLastChar: String = ""
        var cityFirstChar: String = ""
        var newCity: String = ""
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            answerButtonOutlet.layer.cornerRadius = 10
            finishButtomOutlet.layer.cornerRadius = 10
            let imageCity = UIImage(named: "city2")
            cityImage.image = imageCity
            cityImage.alpha = 0.3

            playerLabel.text = "\(players[player])"
            let random = Int.random(in: 0...city.cities.count - 1)
            cityLabel.text = city.cities[random]
            gameOverCity.append(cityLabel.text ?? " ")
            cityCheck()
            cityTF.text = cityFirstChar.uppercased()
            for _ in 0...players.count {
                playersPoints.append(points)
            }
        }
        

        @IBAction func answerButton(_ sender: UIButton) {
            newCity = cityTF.text ?? " "
            cityCheck()
            if  cityTF.text?.first == String.Element(cityFirstChar.uppercased())  {
                if gameOverCity.contains(newCity){
                    showAlert(title: "Sorry!!!!", message: "Такой город уже использован!")
                    cityTF.text = cityFirstChar.uppercased()
                }else {
                    if city.cities.contains(newCity){
                        cityLabel.text = newCity
                        gameOverCity.append(newCity)
                        animation()
                        points = playersPoints[player]
                        points += 10
                        playersPoints[player] = points
                        points = 0 
                        playerStep()
                        cityCheck()
                        cityTF.text = cityFirstChar.uppercased()
                        
                    }else {
                        showAlert(title: "Sorry!!!!!!", message: "Такого города не существует!")
                        cityTF.text = cityFirstChar.uppercased()
                    }
            
            
                }
            } else {
                showAlert(title: "Sorry!!!!", message: "Город должен начинаться на \(cityFirstChar)")
                cityTF.text = cityFirstChar.uppercased()
            }
            
        }
    
    @IBAction func finishButton(_ sender: UIButton) {
        players.remove(at: player)
        player -= 1
        if players.count == 1 {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            guard let finalPVPVC = mainStoryboard.instantiateViewController(withIdentifier: "FinalPVPVC") as? FinalPVPVC else { return }
            finalPVPVC.player = players[0]
            finalPVPVC.modalPresentationStyle = .fullScreen
            show(finalPVPVC, sender: nil)
        }
        playerStep()
    }
    
        private func animation() {
            UILabel.animate(withDuration: 1,
                            delay: 0,
                            animations: {
                            self.cityLabel.frame.origin.x -= 200
            })
        }
     
    
        private func cityCheck(){
            cityLastChar = "\(cityLabel.text?.last ?? " ")"
            switch cityLastChar {
            case "ь":
                cityFirstChar = "\(cityLabel.text?.getCharAtIndexOne(cityLabel.text!.count - 2) ?? " ")"
            case "ъ":
                 cityFirstChar = "\(cityLabel.text?.getCharAtIndexOne(cityLabel.text!.count - 2) ?? " ")"
            case "ы":
                 cityFirstChar = "\(cityLabel.text?.getCharAtIndexOne(cityLabel.text!.count - 2) ?? " ")"
            default:
                cityFirstChar = cityLastChar
            }
        }
         private func playerStep() {
            if player >= players.count - 1  {
                player = 0
                playerLabel.text = players[player]
            } else {
                player += 1
                playerLabel.text = players[player]
            }
        }
       
        
        private func showAlert(title: String, message: String, textField: UITextField? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true)
        }
        
    }
    extension String {
        func getCharAtIndexOne(_ index: Int) -> Character {
            return
                self[self.index(self.startIndex, offsetBy: index)]
        }
    }

