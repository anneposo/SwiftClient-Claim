//
//  DetailViewController.swift
//  SimpleHTTPClient1
//
//  Created by ITLoaner on 11/4/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit

class DetailViewController : ViewController {
    
    var claimTitle : String = ""

    override func refreshScreen() {
        // update status message
        if cService.status == true {
            detailScreenGenerator.statusMsg[0].text = "Claim \(claimTitle) was successfully created."
        } else {
            detailScreenGenerator.statusMsg[0].text = "Claim \(claimTitle) failed to be created."
        }
        
        // clear textfield boxes
        detailScreenGenerator.vals[0].text = ""
        detailScreenGenerator.vals[1].text = ""
        
        // Enable/Disable the button
        detailScreenGenerator.nextBtn.isEnabled = true
    }
    
    @objc func addClaimBtnAction(sender: UIButton) {
        
        claimTitle = detailScreenGenerator.vals[0].text!
        let date: String = detailScreenGenerator.vals[1].text!
        print("input claim: \(claimTitle)")
        print("input date: \(date)")
        
        // creates claim object from user input and calls REST add service
        cService.addClaim(cObj: Claim(title: claimTitle, date: date))
        print("status: \(cService.status)")
        
        // update screen
        refreshScreen()
    }
    
    var detailScreenGenerator : ClaimDetailScreenGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. Create screen
        detailScreenGenerator = ClaimDetailScreenGenerator(v: view)
        print("Screen generator initialized. ")
        detailScreenGenerator.generate()
        
        // 2. Prepare data
        cService = ClaimService(vc: self)
        
        // 3. Set the event handling
        let nBtn = detailScreenGenerator.nextBtn
        nBtn?.addTarget(self, action: #selector(addClaimBtnAction(sender:)), for: .touchUpInside)
    }
}
