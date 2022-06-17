//
//  TipBrain.swift
//  Splitty
//
//  Created by Никита Гавриленко on 16.06.2022.
//

struct SplitBrain {
    
    var splitInfo: SplitInfo?
    var bill: Float?
    var tipPercentage: Float = 0.1
    var splitNumber: Int = 1

    mutating func getTipPercentage(_ percentageValue: String) {
        var percentage = percentageValue
        
        if let i = percentage.firstIndex(of: "%") {
            percentage.remove(at: i)
        }
        
        tipPercentage = Float(percentage)! / 100.0
    }
    
    
    mutating func calculateSplit(billAmount: String, splitNumber: String) {
        let bill = Float(billAmount) ?? 0.0
        let split = Int(splitNumber) ?? 1
        let tip = tipPercentage
        
        let splitBillAmount = (bill + ( bill * tip)) / Float(split)
        
        splitInfo = SplitInfo(splitBillAmount: splitBillAmount, splitNumber: split, tipPercentage: tip)
    }
    
    func getFinalAmount( ) -> String {
        return splitInfo?.splitBillAmount != nil ? String(splitInfo!.splitBillAmount!) : "0.0"
    }
    
    func getSplitNumber( ) -> Int {
        return splitNumber
    }
    
    func getPercentageTip( ) -> Float {
        return tipPercentage
    }
 
    
}
