//
//  LabelColumnGenerator.swift
//  SimpleHTTPClient1
//
//  Created by ITLoaner on 10/30/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit

class LabelColumnGeneartor {
    
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        //stackView.alignment = .fill
        //
        var lbl = UILabel()
        lbl.text = "First Name"
        lbl.backgroundColor = UIColor.yellow
        lbl.sizeToFit()
        stackView.addArrangedSubview(lbl)
        lbl = UILabel()
        lbl.text = "Last Name"
        lbl.backgroundColor = UIColor.yellow
        lbl.sizeToFit()
        stackView.addArrangedSubview(lbl)
        lbl = UILabel()
        lbl.text = "SSN"
        lbl.backgroundColor = UIColor.yellow
        lbl.sizeToFit()
        stackView.addArrangedSubview(lbl)
        return stackView
    }
}
