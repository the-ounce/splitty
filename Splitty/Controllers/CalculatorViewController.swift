//
//  ViewController.swift
//  Splitty
//
//  Created by Никита Гавриленко on 16.06.2022.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    
    var splitBrain = SplitBrain()


    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        billTextField.delegate = self
        
        splitBrain.splitNumber = Int(sender.value)
        splitNumberField.text = String(splitBrain.splitNumber)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        deselectButtons()
        sender.isSelected = true
        
        let percentageValue = sender.currentTitle!
        splitBrain.getTipPercentage(percentageValue)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billText = billTextField.text ?? "0"
        let splitText = splitNumberField.text ?? "0"
        
        splitBrain.calculateSplit(billAmount: billText, splitNumber: splitText)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            let peopleNum = splitBrain.getSplitNumber()
            let tip = Int(splitBrain.getPercentageTip() * 100.0)
            
            destinationVC.billText = splitBrain.getFinalAmount()
            destinationVC.settingsText = "Split between \(peopleNum) people, with \(tip)% tip"
        }
    }
    
    func deselectButtons() {
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        let charNumber = billTextField.text?.count ?? 0
        if charNumber > 6 {
            billTextField.endEditing(true)
            print("fadsf")
            return true
        } else {
            return false
        }
    }
    
    
    
}

