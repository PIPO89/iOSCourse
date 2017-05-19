//
//  CategoryViewController.swift
//  News
//
//  Created by Felipe Soto Campos on 5/18/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    var categories = [Category]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCategories()
        tableView.registerCustomCell(identifier: CategoryTableViewCell.getCellIdentifier())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func initializeCategories() {
        let economyCategory = Category(name: "Economy", image: "economy")
        let sportCategory = Category(name: "Sports", image: "sports")
        let incidentsCategory = Category(name: "Incidents", image: "incident")
        let technologyCategory = Category(name: "Technology", image: "technology")
        categories = [economyCategory, sportCategory, incidentsCategory, technologyCategory]
    }
    
}

extension CategoryViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.getCellIdentifier()) as! CategoryTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
