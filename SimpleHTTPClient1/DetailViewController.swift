//
//  DetailViewController.swift
//  SimpleHTTPClient1
//
//  Created by ITLoaner on 11/4/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit

class DetailViewController : ViewController {

    //override func refreshScreen(pObj: Person) {
    override func refreshScreen() {
        //
        //detailScreenGenerator.vals[0].text = pObj.firstName
        //detailScreenGenerator.vals[1].text = pObj.lastName
        //detailScreenGenerator.vals[2].text = pObj.ssn
        detailScreenGenerator.vals[0].text = ""
        detailScreenGenerator.vals[1].text = ""
        print("val1: \(detailScreenGenerator.vals[0])")
        print("val2: \(detailScreenGenerator.vals[1])")
        // Enable/Disable the button
        detailScreenGenerator.nextBtn.isEnabled = true
        // Change the brightness if needed
        /*if detailScreenGenerator.nextBtn.isEnabled {
            detailScreenGenerator.nextBtn.backgroundColor = detailScreenGenerator.nextBtn.backgroundColor?.withAlphaComponent(1.0)
        } else {
            detailScreenGenerator.nextBtn.backgroundColor = detailScreenGenerator.nextBtn.backgroundColor?.withAlphaComponent(0.3)
        }*/
        
    }

    var detailScreenGenerator : PersonDetailScreenGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. Create screen
        detailScreenGenerator = PersonDetailScreenGenerator(v: view)
        print("Screen generator initialized. ")
        detailScreenGenerator.generate()
        
        // 2. Prepare data
        //pService = PersonService(vc : self)
        //pService.getAll()
        cService = ClaimService(vc: self)
        
        // 3. Set the event handling
        let nBtn = detailScreenGenerator.nextBtn
        nBtn?.addTarget(self, action: #selector(goNextPerson(sender:)), for: .touchUpInside)
    }
}
