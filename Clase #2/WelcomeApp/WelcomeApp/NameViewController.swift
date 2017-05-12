//
//  NameViewController.swift
//  WelcomeApp
//
//  Created by Felipe Soto Campos on 5/11/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {
    
    var stringNameLabel: String?

    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Bienvenido \n \(stringNameLabel!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
