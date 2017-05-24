//
//  NewsDetailTableViewController.swift
//  News
//
//  Created by Felipe Soto Campos on 5/23/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

protocol NewsDetailTableViewControllerDelegate : class {
    func addNews(news: News)
}

class NewsDetailTableViewController: UITableViewController {

    @IBOutlet weak var titletxt: UITextField!
    @IBOutlet weak var descriptiontxt: UITextView!
    
    weak var delegate: NewsDetailTableViewControllerDelegate?
    
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
        let news = News(titleNews: titletxt.text!, descriptionNews: descriptiontxt.text!, createdAt: Date())
        delegate?.addNews(news: news)
        navigationController?.popViewController(animated: true)
    }
    
}
