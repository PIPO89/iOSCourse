//
//  LanguagesViewController.swift
//  Translate
//
//  Created by Felipe Soto Campos on 6/1/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

class LanguagesViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func languageSelector(_ sender: Any) {
        
    }
}

extension LanguagesViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ""
    }    
}
