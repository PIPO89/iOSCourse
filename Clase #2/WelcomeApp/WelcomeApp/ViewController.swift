//
//  ViewController.swift
//  WelcomeApp
//
//  Created by Felipe Soto Campos on 5/11/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnSaludar(_ sender: Any) {
        
//        let alertController = UIAlertController(title: "Infomación", message: "Usted presionó un botón", preferredStyle: .alert)
//        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alertController.addAction(action)
//        present(alertController, animated: true)
        
        let nameViewController = (storyboard?.instantiateViewController(withIdentifier: "NameViewController"))! as! NameViewController
        if let name = nameTextField.text {
            nameViewController.stringNameLabel = name
        }
        navigationController?.pushViewController(nameViewController, animated: true)
        
    }
    
}
