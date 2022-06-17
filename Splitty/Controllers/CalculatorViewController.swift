//
//  ViewController.swift
//  Splitty
//
//  Created by Никита Гавриленко on 16.06.2022.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    
    var splitBrain = SplitBrain()

    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
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
        
    }
    
    func deselectButtons() {
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
    }
    
    
}

