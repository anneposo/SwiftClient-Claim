//
//  ViewController.swift
//  SimpleHTTPClient1
//
//  Created by ITLoaner on 10/6/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func refreshScreen() {
        vals[0].text! = ""
        vals[1].text! = ""
    }

    var lbls = [UILabel]()
    var vals = [UITextField]()
    var nextBtn : UIButton!
    var cService : ClaimService!
 
}

