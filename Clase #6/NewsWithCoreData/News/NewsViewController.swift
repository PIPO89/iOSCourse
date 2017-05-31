//
//  NewsViewController.swift
//  News
//
//  Created by Felipe Soto Campos on 5/18/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    var news : [News]?
    var category: Category?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCustomCell(identifier: NewsTableViewCell.getCellIdentifier())
        createAddButtom()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        news = category?.news.allObjects as? [News]
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createAddButtom() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func addAction() {
        let viewcontroller = storyboard!.instantiateViewController(withIdentifier: NewsDetailTableViewController.getUIViewControllerIdentifier()) as! NewsDetailTableViewController
        viewcontroller.category = category
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
}

extension NewsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = news?.count else {
            return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.getCellIdentifier()) as! NewsTableViewCell
        cell.setUpCell(news: news![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
