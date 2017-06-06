//
//  NumbersViewController.swift
//  Quiz #2
//
//  Created by Felipe Soto Campos on 5/18/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController {

    var numbersArrays = [Int]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeNumberArray()
        tableView.registerCustomCell(identifier: NumberTableViewCell.getCellIdentifier())
    }
    
    func initializeNumberArray() {
        for index in 1...100 {
            numbersArrays.append(index)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension NumbersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbersArrays.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NumberTableViewCell.getCellIdentifier()) as! NumberTableViewCell
        let number = numbersArrays[indexPath.row]
        cell.numberLabel.text = "\(number)"
        
        if (number % 2) == 0 {
            cell.backgroundColor = UIColor.red
        } else {
            cell.backgroundColor = UIColor.blue
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

}
