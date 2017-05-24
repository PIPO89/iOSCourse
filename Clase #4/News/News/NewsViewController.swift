//
//  NewsViewController.swift
//  News
//
//  Created by Felipe Soto Campos on 5/18/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

protocol NewsViewControllerDelegate : class {
    func newsToCategory(arrayNews: [News], type: CategoryType)
}

class NewsViewController: UIViewController {
    
    var news : [News]?
    var categotyType: CategoryType?
    
    weak var delegate: NewsViewControllerDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCustomCell(identifier: NewsTableViewCell.getCellIdentifier())
        createAddButtom()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let news = news, let categotyType = categotyType {
            delegate?.newsToCategory(arrayNews: news, type: categotyType)
        }
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
        viewcontroller.delegate = self
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
}

extension NewsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (news?.count)!
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

extension NewsViewController : NewsDetailTableViewControllerDelegate {
    func addNews(news: News) {
        self.news?.append(news)
        self.tableView.reloadData()
    }
}
