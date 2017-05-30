//
//  AddCatViewController.swift
//  Quiz #4
//
//  Created by Felipe Soto Campos on 5/30/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

class AddCatViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Cat"
        addCat()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addCat() {
        let addBUtton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = addBUtton
    }
    
    func addAction() {
        if(validatedFiled()) {
            let catName = txtName.text!
            if(RealmManager.validatedCat(name: catName)) {
                RealmManager.createCat(name: catName)
                navigationController?.popViewController(animated: true)
            } else {
                txtName.text = ""
                displayAlert(pMessage: "El gato \(catName) ya fue ingresado")
            }
        }
    }
    
    func validatedFiled() -> Bool {
        if txtName.text! .isEmpty {
            displayAlert(pMessage: "Favor ingresar un nombre")
            return false
        }
        return true
    }
    
    func displayAlert(pMessage: String?) {
        let alertController = UIAlertController(title: "Error", message: pMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
}
