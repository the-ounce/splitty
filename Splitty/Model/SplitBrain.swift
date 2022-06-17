//
//  TipBrain.swift
//  Splitty
//
//  Created by Никита Гавриленко on 16.06.2022.
//

struct SplitBrain {
    
    var splitInfo: SplitInfo?
    var selectedTipPercentage: Float?
    var splitNumber: Int = 1
    
    mutating func getTipPercentage(_ percentageValue: String) {
        
        var percentage = percentageValue
        
        if let i = percentage.firstIndex(of: "%") {
            percentage.remove(at: i)
        }
        
        selectedTipPercentage = Float(percentage)! / 100.0
    }
    
    
    func calculateSplit( ) {
        
    }
    
    func getFinalAmount( ) {
        
    }
    
    func getSplitNumber( ) {
        
    }
    
    func getPercentageTip( ) {
        
    }
 
    
}
