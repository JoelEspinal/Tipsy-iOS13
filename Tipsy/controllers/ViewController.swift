//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.0
    var splitCount = 2
    var dividedBill: Float?
    
    var tipString: String? = "10%"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.keyboardType = .numberPad
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        selectTip(sender: sender, buttonTip: zeroPctButton)
        selectTip(sender: sender, buttonTip: tenPctButton)
        selectTip(sender: sender, buttonTip: twentyPctButton)
    }
    
    func selectTip(sender: UIButton, buttonTip: UIButton?) {
        tipString = sender.titleLabel?.text
        if sender.titleLabel?.text == "0%"{
            tip = 0.0
            tipString = "0%"
        } else if  sender.titleLabel?.text == "10%" {
            tip = 0.10
            tipString = "10%"
        } else {
            tip = 0.20
            tipString = "20%"
        }
            
            
        if sender.titleLabel?.text == buttonTip?.currentTitle {
            buttonTip?.isSelected = true
            buttonTip?.setTitleColor(UIColor.white, for: .normal)
        } else {
            buttonTip?.isSelected = false
            buttonTip?.setTitleColor( UIColor(red: 0.0, green: 176/255, blue: 107/255, alpha: 1.0), for: .normal)
        }
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let currentStringValue = sender.value
        splitNumberLabel.text = String(Int(currentStringValue))
        splitCount = Int(currentStringValue)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        let billValue = Float(billTextField?.text ?? "")
        let tipBilled = Float(billValue ?? 0.0 * Float(tip))
        dividedBill = tipBilled / Float(splitCount)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationViewController =  segue.destination as! ResultsViewController
            destinationViewController.tipPersentage = tipString!
            destinationViewController.totalPerPerson = dividedBill!
            let messge1 = "Split between " + String(splitCount)
            let message2 = " people, \n with " + tipString! + "tip."
            
            destinationViewController.message = messge1 + message2
        }
    }
}
