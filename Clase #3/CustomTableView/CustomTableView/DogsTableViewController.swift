//
//  DogsTableViewController.swift
//  CustomTableView
//
//  Created by Felipe Soto Campos on 5/16/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit

class DogsTableViewController: UITableViewController {
    
    let keyName = "keyName"
    let keyColor = "keyColor"
    let keyAge = "keyAge"
    
    var dataSource: [[String:Any]]? //Se pone el signo de exclamación debido a que no se está inicializando
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCell()
        initializeDataSourcewithDictionary()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = dataSource?.count {
            return count
        }
        return 0
        //        guard let count = dataSource?.count else {
        //            return 0
        //        }
        //        return count
    }
    
    func initializeDataSourcewithDictionary() {
        let dog1 = [keyName: "Bruno", keyColor: "Negro", keyAge: "2 años"]
        let dog2 = [keyName: "Dany", keyColor: "Blanco", keyAge: "1 años"]
        let dog3 = [keyName: "Perla", keyColor: "Blanco", keyAge: "3 años"]
        let dog4 = [keyName: "Scoth", keyColor: "Negro", keyAge: "4 años"]
        dataSource = [dog1,dog2,dog3,dog4]
    }
    
    func registerCustomCell() {
        let nib = UINib(nibName: "DogTableViewCell", bundle: nil) //Es un .xib, se llama nib dentro del código
        tableView.register(nib, forCellReuseIdentifier: "DogTableViewCell")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DogTableViewCell", for: indexPath) as! DogTableViewCell
        let dog = dataSource![indexPath.row]
        
        cell.nameLabel.text = (dog[keyName] as! String)
        cell.colorLabel.text = (dog[keyColor] as! String)
        cell.ageLabel.text = (dog[keyAge] as! String)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
