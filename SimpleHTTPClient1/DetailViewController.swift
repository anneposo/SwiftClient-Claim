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
        detailScreenGenerator.vals[0].text = ""
        detailScreenGenerator.vals[1].text = ""
        // Enable/Disable the button
        detailScreenGenerator.nextBtn.isEnabled = true
        // Change the brightness if needed
        /*if detailScreenGenerator.nextBtn.isEnabled {
            detailScreenGenerator.nextBtn.backgroundColor = detailScreenGenerator.nextBtn.backgroundColor?.withAlphaComponent(1.0)
        } else {
            detailScreenGenerator.nextBtn.backgroundColor = detailScreenGenerator.nextBtn.backgroundColor?.withAlphaComponent(0.3)
        }*/
        
    }
    
    @objc func addClaimBtnAction(sender: UIButton) {
        //var cService : ClaimService!
        
        let claim: String = detailScreenGenerator.vals[0].text!
        let date: String = detailScreenGenerator.vals[1].text!
        print("input claim: \(claim)")
        print("input date: \(date)")
        cService.addClaim(cObj: Claim(title: claim, date: date))
        refreshScreen()
    }

    var detailScreenGenerator : PersonDetailScreenGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. Create screen
        detailScreenGenerator = PersonDetailScreenGenerator(v: view)
        print("Screen generator initialized. ")
        detailScreenGenerator.generate()
        
        // 2. Prepare data
        cService = ClaimService(vc: self)
        
        // 3. Set the event handling
        let nBtn = detailScreenGenerator.nextBtn
        nBtn?.addTarget(self, action: #selector(addClaimBtnAction(sender:)), for: .touchUpInside)
    }
}
