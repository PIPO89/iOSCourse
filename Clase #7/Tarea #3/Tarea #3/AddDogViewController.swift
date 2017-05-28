//
//  AddDogViewController.swift
//  Tarea #3
//
//  Created by Felipe Soto Campos on 5/28/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

class AddDogViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtColor: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        self.title = "Add Dog"
        addDog()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addDog() {
        let addBUtton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = addBUtton
    }
    
    func addAction() {
        if(validatedFiled()) {
            RealmManager.createDog(name: txtName.text!, color: txtColor.text!)
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func addImgDog(_ sender: Any) {
        
    }
    
    func validatedFiled() -> Bool {
        if txtName.text! .isEmpty {
            displayAlert(pMessage: "Favor ingresar un nombre")
            return false
        }
        if txtColor.text! .isEmpty {
            displayAlert(pMessage: "Favor ingresar un color")
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
