//
//  ViewController.swift
//  cafeCollectionChen
//
//  Created by ALVIN CHEN on 9/18/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemTextField: UITextField!

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var displayOutlet: UILabel!
    
    @IBOutlet weak var cartOutlet: UILabel!
    var menu = ""
    var cartText = ""
    var itemArray: [String] = ["food1","food2","food3","food4","food5"]
    var priceArray: [Double] = [1.00,2.00,3.00,4.00,5.00]
    var quantity = 0
    var totalPrice = 0.0
    var cart: [String: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quantityTextField.delegate = self
        itemTextField.delegate = self
        
        //include a way to ignore case sensitivity when searching
        for i in 0...(itemArray.count-1){
            menu += "\(itemArray[i]), \(priceArray[i]) \n"
        }
        displayOutlet.text = menu

    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        errorLabel.text = ""
        var item = "something"
        var quantity = (Int)(quantityTextField.text!)
        var quantity2 = 0
        var x = false
        
        for i in 0...(itemArray.count-1){
            if itemArray[i] == itemTextField.text{
                item = itemTextField.text!
                errorLabel.text = ""
                break

            }
            else{
                errorLabel.text = "item not found"
            }
        }

        
        if let q = quantity{
            quantity2 = q
        }
        else{
            errorLabel.text = "invalid quantity"
        }
        
        for (key, _) in cart {
            //does not check for duplicates, fix that
            if (key == item){
                errorLabel.text = "Duplicate Item Found"
            }
            else{
               cart["\(item)"] = quantity2
            }
        }

        for(key,value) in cart{
            cartText += "\(value) \(key) \n"
        }
        cartOutlet.text = cartText
        
    quantityTextField.resignFirstResponder()
       itemTextField.resignFirstResponder()
    }
    
    
    
    
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
        
    }


}

