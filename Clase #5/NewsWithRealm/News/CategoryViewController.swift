//
//  CategoryViewController.swift
//  News
//
//  Created by Felipe Soto Campos on 5/18/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UIViewController {

    var categories: Results<Category>?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCategories()
        tableView.registerCustomCell(identifier: CategoryTableViewCell.getCellIdentifier())
        self.title = "Categories"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func initializeCategories() {
        categories = RealmManager.getAllCategories()
    }
    
}

extension CategoryViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsViewController = storyboard?.instantiateViewController(withIdentifier: NewsViewController.getUIViewControllerIdentifier()) as! NewsViewController
        newsViewController.categotyType = categories![indexPath.row].categoryType
        navigationController?.pushViewController(newsViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let categories = categories else {
            return 0
        }
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.getCellIdentifier()) as! CategoryTableViewCell
        cell.setUpCell(category: categories![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension CategoryViewController : NewsViewControllerDelegate {
//    func newsToCategory(arrayNews: [News], type: CategoryType) {
//        let index = categories.index { $0.type == type }
//        if let indexUnraped = index {
//            let categoryUpdate = categories[indexUnraped]
//            categoryUpdate.newArray = arrayNews
//            categories[indexUnraped] = categoryUpdate
//        }
//    }
}
