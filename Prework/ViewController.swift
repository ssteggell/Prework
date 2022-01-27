//
//  ViewController.swift
//  Prework
//
//  Created by Spencer Steggell on 1/10/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var partyStepper: UIStepper!
    @IBOutlet weak var partyNumber: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.delegate = self
        self.title = "Tip Calculator"
        self.billAmountTextField.becomeFirstResponder()
    }
    
    @IBAction func partyValueChanged(_ sender: UIStepper) {
        partyNumber.text = Int(sender.value).description
        calculateTipFunc()
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        calculateTipFunc()
    }
    
    func textFieldDidBeginEditing(_ billAmountTextField: UITextField) {
        calculateTipFunc()
    }
    
    func textFieldDidEndEditing(_ billAmountTextField: UITextField) {
        calculateTipFunc()
    }
        
    
    
    
    func calculateTipFunc() {
        
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.20]
        let party = Double(partyNumber.text!) //?? 1
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = (tip + bill) / party!
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text  = String(format: "$%.2f", total)
        
    }
    
    
}

