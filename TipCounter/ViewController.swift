//
//  ViewController.swift
//  TipCounter
//
//  Created by Henry Guerra on 10/23/18.
//

import UIKit

class ViewController: UIViewController {

    // outlets
    @IBOutlet weak var basePriceInput: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var grandTotalLabel: UILabel!
    @IBOutlet weak var tipAmountSegControl: UISegmentedControl!
    @IBOutlet weak var grandTotalBackground: UIView!
    @IBOutlet weak var tipBackground: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
        roundSubviews(amount: 5.0)
    }
    
    // dismiss keyboard
    func dismissKeyboard() {
        let tapOutOfKeyboard = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        self.view.addGestureRecognizer(tapOutOfKeyboard)
    }
    
    // round subview corners
    func roundSubviews(amount: CGFloat) {
        let radius = CGFloat(amount)
        self.grandTotalBackground.roundCorners(withRadius: radius)
        self.tipBackground.roundCorners(withRadius: radius)
        self.tipAmountSegControl.roundCorners(withRadius: amount)
    }
   
    @IBAction func calcTip(_ sender: Any) {
        // if invalid number or nil value, return 0
        let bill = Double(basePriceInput.text!) ?? 0
        
        let tipPercentages = [0.18, 0.20, 0.25]
        let tip = bill * tipPercentages[tipAmountSegControl.selectedSegmentIndex]
        let total = bill + tip
        
        // now set the total price label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        grandTotalLabel.text = String(format: "$%.2f", total)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension UIView {
    // want to add corner radius to subviews
    func roundCorners(withRadius radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.layer.isOpaque = false
    }
}

