//
//  EnterNumberViewController.swift
//  Quiz #3
//
//  Created by Felipe Soto Campos on 5/23/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

class EnterNumberViewController: UIViewController {
    
    var arrayValues = [Any]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCustomCell(identifier: NumberCustomCell.getCellIdentifier())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func insertText(_ sender: Any) {
        view.endEditing(true)
        if inputTextField.text!.isEmpty {
            let alertController = UIAlertController(title: "ERROR", message: "Debe digitar información dentro del text field", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true)
        } else {
            arrayValues.append(inputTextField.text!)
            tableView.reloadData()
            inputTextField.text = ""
        }
    }

}

extension EnterNumberViewController : UITableViewDelegate, UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NumberCustomCell.getCellIdentifier()) as! NumberCustomCell
        let value = arrayValues[indexPath.row]
        cell.numberLabel.text = "\(value)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}
