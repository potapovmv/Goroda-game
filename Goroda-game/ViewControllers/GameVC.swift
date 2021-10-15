//
//  GameVC.swift
//  Goroda-game
//
//  Created by Admin1 on 23.08.2021.
//  Copyright © 2021 PotapovMV. All rights reserved.
//

import UIKit

class GameVC: UIViewController {

    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var playerLabel: UILabel!
    
    @IBOutlet weak var cityTF: UITextField!
    
    @IBOutlet weak var cityImage: UIImageView!
    
    
    @IBOutlet weak var answerButtonOutlet: UIButton!
    @IBOutlet weak var finishButtomOutlet: UIButton!
    
    var city = DataManager()
    var playerPoints = 0
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

        playerLabel.text = "\(playerPoints)"
        let random = Int.random(in: 0...city.cities.count - 1)
        cityLabel.text = city.cities[random]
        gameOverCity.append(cityLabel.text ?? " ")
        city.cities.remove(at: random)
        cityCheck()
        cityTF.text = cityFirstChar.uppercased()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let finalVC = segue.destination as? FinalVC else {return}
        finalVC.playerPoints = playerPoints
        finalVC.city = gameOverCity
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
                    if let index = city.cities.firstIndex(of: newCity) {
                        city.cities.remove(at: index)
                    }
                    points()
                    animation()
                    aI()
                }else {
                    showAlert(title: "Sorry!!!!!!", message: "Такого города не существует!")
                    cityTF.text = cityFirstChar.uppercased()
                }
        
        
            }
        } else {
            showAlert(title: "Sorry!!!!", message: "Город должен начинаться на \(cityFirstChar.uppercased())")
            cityTF.text = cityFirstChar.uppercased()
        }
        
    }
    
    private func animation() {
        UILabel.animate(withDuration: 1,
                        delay: 0,
                        animations: {
                                self.cityLabel.frame.origin.x -= 200
        })
    }
    private func aI() {
        cityCheck()
        var randomAI = Int.random(in: 0...city.cities.count - 1)
        var cityAI = city.cities[randomAI]
        while cityAI.first != String.Element(cityFirstChar.uppercased()){
            randomAI = Int.random(in: 0...city.cities.count - 1)
            cityAI = city.cities[randomAI]
        }
        cityLabel.text = cityAI
        cityCheck()
        cityTF.text = cityFirstChar.uppercased()
        gameOverCity.append(cityAI)
        if let index = city.cities.firstIndex(of: cityAI) {
            city.cities.remove(at: index)
        }
    }
    private func points() {
        playerPoints += 10
        playerLabel.text = "\(playerPoints)"
    }
    private func cityCheck(){
        cityLastChar = "\(cityLabel.text?.last ?? " ")"
        switch cityLastChar {
        case "ь":
            cityFirstChar = "\(cityLabel.text?.getCharAtIndex(cityLabel.text!.count - 2) ?? " ")"
           
        case "ъ":
             cityFirstChar = "\(cityLabel.text?.getCharAtIndex(cityLabel.text!.count - 2) ?? " ")"
        case "ы":
             cityFirstChar = "\(cityLabel.text?.getCharAtIndex(cityLabel.text!.count - 2) ?? " ")"
        default:
            cityFirstChar = cityLastChar
        }
    }
    /*  private func playerStep() {
        if player > 1 {
            player = 1
        }else {
        player += 1
        }
        switch player {
        case 1:
            playerLabel.text = "Вы"
        default:
            playerLabel.text = "Компьютер"
        }
    }*/
   
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(okButton)
    present(alert, animated: true)
    }
    
}
extension String {
    func getCharAtIndex(_ index: Int) -> Character {
        return
            self[self.index(self.startIndex, offsetBy: index)]
    }
}
