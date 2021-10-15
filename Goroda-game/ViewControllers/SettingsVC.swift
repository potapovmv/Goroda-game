//
//  SettingsVC.swift
//  Goroda-game
//
//  Created by Admin1 on 27.09.2021.
//  Copyright © 2021 PotapovMV. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    var player = 1
    var players: [String] = []
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var addNameButtonOutlet: UIButton!
    @IBOutlet weak var gameButtonOutlet: UIButton!
    
    @IBOutlet weak var nameOne: UILabel!
    @IBOutlet weak var nameTwo: UILabel!
    @IBOutlet weak var nameThree: UILabel!
    @IBOutlet weak var nameFour: UILabel!
    @IBOutlet weak var nameFive: UILabel!
    @IBOutlet weak var nameSix: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNameButtonOutlet.layer.cornerRadius = 10
        gameButtonOutlet.layer.cornerRadius = 10
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gamePVPVC = segue.destination as? GamePVPVC else { return }
        gamePVPVC.players = players
    }
    @IBAction func addName(_ sender: UIButton) {
        if nameTF.text == nil {
            showAlert(title: "Внимание!!", message: "Имя не может быть пустым!")
        }else if player > 6{
            showAlert(title: "Вннимание!!", message: "Максимум 6 игроков!")
        }else{
            switch player {
            case 1:
                nameOne.text = nameTF.text
                nameOne.isHidden = false
                players.append(nameTF.text ?? " ")
            case 2:
                nameTwo.text = nameTF.text
                nameTwo.isHidden = false
                players.append(nameTF.text ?? " ")
            case 3:
                nameThree.text = nameTF.text
                nameThree.isHidden = false
                players.append(nameTF.text ?? " ")
            case 4:
                nameFour.text = nameTF.text
                nameFour.isHidden = false
                players.append(nameTF.text ?? " ")
            case 5:
                nameFive.text = nameTF.text
                nameFive.isHidden = false
                players.append(nameTF.text ?? " ")
            default:
                nameSix.text = nameTF.text
                nameSix.isHidden = false
                players.append(nameTF.text ?? " ")
            }
            player += 1
            nameTF.text = nil
            nameTF.placeholder = "Введите имя"
        }
    }
    
    @IBAction func gameButton(_ sender: UIButton) {
        if player <= 2 {
            showAlert(title: "Внимание!!", message: "Игроков должно быть минимум 2!")
        }
        /*else {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            guard let gamePVPVC = mainStoryboard.instantiateViewController(withIdentifier: "GamePVPVC") as? GamePVPVC else { return }
            gamePVPVC.players = players
            gamePVPVC.modalPresentationStyle = .fullScreen
            show(gamePVPVC, sender: nil)
        }*/
    }
    
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(okButton)
    present(alert, animated: true)
    }
}
