//
//  NewsDetailTableViewController.swift
//  News
//
//  Created by Felipe Soto Campos on 5/23/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

class NewsDetailTableViewController: UITableViewController {

    @IBOutlet weak var titletxt: UITextField!
    @IBOutlet weak var descriptiontxt: UITextView!
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSaveNews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addSaveNews() {
        let saveAction = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewsAction))
        navigationItem.rightBarButtonItem = saveAction
    }
    
    func saveNewsAction() {
        CoreDataManager.addNews(category: category!, title: titletxt.text!, description: descriptiontxt.text!)
        navigationController?.popViewController(animated: true)
    }
    
}
