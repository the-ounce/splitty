//
//  ResultViewController.swift
//  Splitty
//
//  Created by Никита Гавриленко on 17.06.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var billText: String?
    var settingsText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalAmountLabel.text = billText
        settingsLabel.text = settingsText
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
