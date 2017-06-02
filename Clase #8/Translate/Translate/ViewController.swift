//
//  ViewController.swift
//  Translate
//
//  Created by Felipe Soto Campos on 6/1/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController, NVActivityIndicatorViewable {

    var languageArray: [[String:String]]?
    
    @IBOutlet weak var originTxt: UITextView!
    @IBOutlet weak var destinationTxt: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicator()
        registerNotifications()
        APIManager.getLanguages()
    }

    func registerNotifications() {
        NotificationCenter.default.addObserver(self,
            selector: #selector(getLanguagesAvailable(notification:)),
            name: Notification.Name(Constants.GET_LANGUAGES_NOTICATION),
            object: nil)
        NotificationCenter.default.addObserver(self,
            selector: #selector(errorFound),
            name: Notification.Name(Constants.ERROR_FOUND_NOTIFICATION),
            object: nil)
    }
    
    func getLanguagesAvailable(notification: Notification) {
        hideActivityIndicator()
        languageArray = notification.userInfo![Constants.LANGUAGE_KEY] as? [[String: String]]
        print("EL TAMAÑO DEL ARRAY ES DE \(languageArray!.count)")
    }
    
    func errorFound() {
        hideActivityIndicator()
        displayAlert(pMessage: "We found an error trying to download the languages, please try later")
    }
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            let size = CGSize(width: 35, height: 35)
            self.startAnimating(size, message: nil, type: NVActivityIndicatorType.pacman)
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.stopAnimating()
        }
    }
    
    func displayAlert(pMessage: String?) {
        let alertController = UIAlertController(title: "Error", message: pMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true)
    }

    @IBAction func originLanguageAction(_ sender: Any) {
    }
    
    @IBAction func destinationLanguageAction(_ sender: Any) {
    }
    
    @IBAction func changeLanguageAction(_ sender: Any) {
    }

}
