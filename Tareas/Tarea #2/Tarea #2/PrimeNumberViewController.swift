//
//  PrimeNumberViewController.swift
//  Tarea #2
//
//  Created by Felipe Soto Campos on 5/22/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

class PrimeNumberViewController: UIViewController {

    var primeNumberArray = [Int]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializePrimeNumberArray()
        tableView.registerCustomCell(identifier: NumberTableViewCell.getCellIdentifier())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initializePrimeNumberArray() {
        primeNumberArray.append(1)
        for index in 1 ... 1000 {
            if(is_prime(n: index)) {
                primeNumberArray.append(index)
            }
        }
    }
    
    func is_prime(n: Int) -> Bool {
        if n <= 1 {
            return false
        }
        if n <= 3 {
            return true
        }
        var i = 2
        while i*i <= n {
            if n % i == 0 {
                return false
            }
            i = i + 1
        }
        return true
    }

}

extension PrimeNumberViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return primeNumberArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NumberTableViewCell.getCellIdentifier()) as! NumberTableViewCell
        let number = primeNumberArray[indexPath.row]
        cell.numberLabel.text = "\(number)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
