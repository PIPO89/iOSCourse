//
//  APIManager.swift
//  Translate
//
//  Created by Felipe Soto Campos on 6/1/17.
//  Copyright © 2017 PIPO. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {

    class func getLanguages() {
        Alamofire.request("\(Constants.API_URL)languages",
            method: .get,
            parameters: nil,
            encoding: URLEncoding.default,
            headers: [Constants.API_HEADER_KEY: Constants.API_KEY])
            .responseJSON {
                (response) in switch response.result {
                case .success:
//                    print("SUCESS")
                    if let dictionary = response.result.value as? [String: AnyObject] {
                        createLanguagesAvailableAnswer(dictionary:
                            dictionary[Constants.LANGUAGE_KEY] as! [String: AnyObject])
                    }
                    break
                case .failure(let error):
                    sendErrorNotification()
                    print("ERROR \(error)")
                    break
            }
        }
    }
    
    class func createLanguagesAvailableAnswer(dictionary: [String: AnyObject]) {
        var languagesArray = [[String: String]]()
        for (key, value) in dictionary {
            if let value = value as? String {
                let dictionaryWithNewFormat = [Constants.DIRS_KEY: key, Constants.LANGUAGES_ARRAY_KEY: value]
                languagesArray.append(dictionaryWithNewFormat)
            } else { //ERROR FOUND
                sendErrorNotification()                
                return
            }
        }
        let result = [Constants.LANGUAGE_KEY: languagesArray]
        NotificationCenter.default.post(name: Notification.Name(Constants.GET_LANGUAGES_NOTICATION), object: nil, userInfo: result)
//        print(dictionary)
    }
    
    class func sendErrorNotification() {
        NotificationCenter.default.post(name: Notification.Name(Constants.ERROR_FOUND_NOTIFICATION), object: nil)
    }
    
}
