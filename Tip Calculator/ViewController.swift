//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Zulwiyoza Putra on 2/9/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlet
    
    @IBOutlet weak var billAmount: UITextField!
    
    @IBOutlet weak var tipPercentageSelector: UISegmentedControl!
    
    @IBOutlet weak var tipAmount: UITextField!
    
    @IBOutlet weak var totalAmount: UITextField!
    
    // Action
    
    @IBAction func calculate(_ sender: Any) {
        
        if let billAmountValue = Double(billAmount.text!) {
            var tipPercentage = 0.0
            
            // Switch statement for tip percentage selector value
            
            switch tipPercentageSelector.selectedSegmentIndex {
            case 0:
                tipPercentage = 0.10
            case 1:
                tipPercentage = 0.15
            case 2:
                tipPercentage = 0.20
            default:
                break
            }
            
            // Formula for total Amount
            
            let roundedBillAmountValue = round(100 * billAmountValue) / 100
            let tipAmountValue = roundedBillAmountValue * tipPercentage
            let roundedTipAmountValue = round(100 * tipAmountValue) / 100
            let totalAmountValue = roundedBillAmountValue + roundedTipAmountValue
            
            
            // Displaying result
            
            if !billAmount.isEditing {
                billAmount.text = String(format: "$ %.2f", roundedBillAmountValue)
            }
            
            tipAmount.text = String(format: "$ %.2f", roundedTipAmountValue)
            totalAmount.text = String(format: "$ %.2f", totalAmountValue)
            
        } else {
            
            // Show error
            
            billAmount.text = ""
            tipAmount.text = ""
            totalAmount.text = ""
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

