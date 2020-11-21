//
//  PersonService.swift
//  SimpleHttpClient
//
//  Created by ITLoaner on 10/1/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import Foundation

struct Claim : Codable {
    var title : String
    var date : String
}


struct Person : Codable {
    var firstName : String
    var lastName : String
    var ssn : String
}

class ClaimService {
    init(vc : ViewController) {
        viewController = vc
    }
    
    var viewController : ViewController
    var claimList : [Claim] = [Claim]()
    
    func addClaim(cObj : Claim) {
        // Implement logic using Async HTTP client API (POST method)
        let requestUrl = "http://localhost:8020/ClaimService/add"
        var request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let jsonData : Data! = try! JSONEncoder().encode(cObj)
        //
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //
        let task = URLSession.shared.uploadTask(with: request, from: jsonData) {
            (data, response, error) in
            if let resp = data {
                // type of resp is Data
                let respStr = String(bytes: resp, encoding: .utf8)
                print("The response data sent from the server is \(respStr!)")
                //
                OperationQueue.main.addOperation {
                    self.viewController.refreshScreen()
                }
            } else if let respError = error {
                print("Server Error : \(respError)")
            }
        }
        task.resume()
    }
    
}

class PersonService {

    init(vc : ViewController) {
        viewController = vc
    }
    
    var viewController : ViewController
    var personList : [Person] = [Person]()
    var currentIndx : Int = 0

    func getNext() -> Person {
        currentIndx = currentIndx + 1
        return personList[currentIndx]
    }

    func isLastEntry() -> Bool {
        if currentIndx == personList.count - 1 {
            return true
        } else {
            return false
        }
        
    }
    
    
    
    func addPerson(pObj : Person) {
        // Implement logic using Async HTTP client API (POST method)
        let requestUrl = "http://localhost:8020/PersonService/add"
        var request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let jsonData : Data! = try! JSONEncoder().encode(pObj)
        //
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //
        let task = URLSession.shared.uploadTask(with: request, from: jsonData) {
            (data, response, error) in
            if let resp = data {
                // type of resp is Data
                let respStr = String(bytes: resp, encoding: .utf8)
                print("The response data sent from the server is \(respStr!)")
                //
            } else if let respError = error {
                print("Server Error : \(respError)")
            }
        }
        task.resume()
    }
    
    func getAll() {
        //var personList = [Person]()
        print("About to send HTTP request to server")
        let requestUrl = "http://localhost:8020/PersonService/getAll"
        let request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let task = URLSession.shared.dataTask(with: request){
            (data, response, error) in
            if let respData = data {
                // data is of Data type
                //et respStr = String(data: respData, encoding: .utf8)
                //print("The response data is \(respStr!)")
                self.personList = try! JSONDecoder().decode([Person].self, from: respData)
                print("The Person List : \(self.personList)")
                //
                //OperationQueue.main.addOperation {
                //    self.viewController.refreshScreen(pObj: self.personList[self.currentIndx])
                //}
            }
        }
        //
        task.resume()
    }
}
