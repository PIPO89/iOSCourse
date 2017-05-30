//
//  CatListViewController.swift
//  Quiz #4
//
//  Created by Felipe Soto Campos on 5/30/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit
import RealmSwift

class CatListViewController: UIViewController {

    var cats: Results<Cat>?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cats"
        goToAddCat()
        tableView.registerCustomCell(identifier: CatCustomTableViewCell.getCellIdentifier())
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initializeDogs()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initializeDogs() {
        cats = RealmManager.getAllCats()
    }
    
    func goToAddCat() {
        let addBUtton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToAction))
        navigationItem.rightBarButtonItem = addBUtton
    }
    
    func goToAction() {
        let viewController = storyboard!.instantiateViewController(withIdentifier: AddCatViewController.getUIViewControllerIdentifier()) as! AddCatViewController
        navigationController?.pushViewController(viewController, animated: true)
    }

}

extension CatListViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CatCustomTableViewCell.getCellIdentifier()) as! CatCustomTableViewCell
        let cat = cats![indexPath.row]
        cell.lblName.text = cat.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cats = cats else {
            return 0
        }
        return cats.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
