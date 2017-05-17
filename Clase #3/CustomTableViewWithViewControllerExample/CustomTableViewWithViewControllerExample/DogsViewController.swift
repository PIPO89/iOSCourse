//
//  DogsViewController.swift
//  CustomTableViewWithViewControllerExample
//
//  Created by Felipe Soto Campos on 5/16/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

class DogsViewController: UIViewController {
    
    var dogs = [Dog]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeDogArray()
        tableView.registerCustomCell(identifier: DogTableViewCell.getCellIdentifier())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initializeDogArray() {
        let dog1 = Dog(name: "Tony", color: "Negro", age: "5")
        let dog2 = Dog(name: "Jose", color: "Cafe", age: "4")
        let dog3 = Dog(name: "Fede", color: "Blanco", age: "7")
        let dog4 = Dog(name: "Alex", color: "Cafe", age: "2")
        let dog5 = Dog(name: "Mau", color: "Blanco", age: "1")
        dogs = [dog1,dog2,dog3,dog4,dog5]
//        dogs.append(dog1)
//        dogs.append(dog2)
//        dogs.append(dog3)
//        dogs.append(dog4)
//        dogs.append(dog5)
    }
    
}

extension DogsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DogTableViewCell.getCellIdentifier()) as! DogTableViewCell
        let dog = dogs[indexPath.row]
        cell.nameLabel.text = dog.name
        cell.colorLabel.text = dog.color
        cell.ageLabel.text = dog.age
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
