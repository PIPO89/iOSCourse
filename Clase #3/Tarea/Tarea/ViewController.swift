//
//  ViewController.swift
//  Tarea
//
//  Created by Felipe Soto Campos on 5/15/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtFieldOne: UITextField!
    @IBOutlet weak var txtFieldTwo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func add(_ sender: Any) {
        if validateFields(field1: txtFieldOne.text, field2: txtFieldTwo.text, divide: false) {
            let one = Float(txtFieldOne.text!)
            let two = Float(txtFieldTwo.text!)
            let result = one! + two!
            displayAlert(pTitle: "ADD", pMessage: NSString(format: "%.2f", result) as String)
        }
    }
    
    @IBAction func subtract(_ sender: Any) {
        if validateFields(field1: txtFieldOne.text, field2: txtFieldTwo.text, divide: false) {
            let one = Float(txtFieldOne.text!)
            let two = Float(txtFieldTwo.text!)
            let result = one! - two!
            displayAlert(pTitle: "SUBTRACT", pMessage: NSString(format: "%.2f", result) as String)
        }
    }
    
    @IBAction func multiply(_ sender: Any) {
        if validateFields(field1: txtFieldOne.text, field2: txtFieldTwo.text, divide: false) {
            let one = Float(txtFieldOne.text!)
            let two = Float(txtFieldTwo.text!)
            let result = one! * two!
            displayAlert(pTitle: "MULTIPLY", pMessage: NSString(format: "%.2f", result) as String)
        }
    }
    
    @IBAction func divide(_ sender: Any) {
        if validateFields(field1: txtFieldOne.text, field2: txtFieldTwo.text, divide: true) {
            let one = Float(txtFieldOne.text!)
            let two = Float(txtFieldTwo.text!)
            let result = one! / two!
            displayAlert(pTitle: "DIVIDE", pMessage: NSString(format: "%.2f", result) as String)
        }
    }
    
    func validateFields(field1: String?, field2: String?, divide: Bool?) -> Bool {
        if field1!.isEmpty {
            displayAlert(pTitle: "INFORMATION", pMessage: "The Value 1 is empty")
            return false
        }
        if field2!.isEmpty {
            displayAlert(pTitle: "INFORMATION", pMessage: "The Value 2 is empty")
            return false
        }
        
        if (Float(field1!) == nil) {
            displayAlert(pTitle: "INFORMATION", pMessage: "The Value 1 is not a number")
            return false
        }
        if (Float(field2!) == nil) {
            displayAlert(pTitle: "INFORMATION", pMessage: "The Value 2 is not a number")
            return false
        }
        
        if ((divide == true ) && (Float(field2!) == 0)) {
            displayAlert(pTitle: "INFORMATION", pMessage: "You can not divide between zero")
            return false
        }
        
        return true
    }
    
    func displayAlert(pTitle: String?, pMessage: String?) {
        let alertController = UIAlertController(title: pTitle, message: pMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
