//
//  PersonDetailSectionGenerator.swift
//  SimpleHTTPClient1
//
//  Created by ITLoaner on 10/27/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit


class TitleGenerator {
    func generate() -> UIStackView {
        let tStackView = UIStackView()
        tStackView.axis = .vertical
        tStackView.distribution = .fill
        tStackView.spacing = 5
        //
        let tLbl = UILabel()
        tLbl.text = "Please enter claim information"
        tLbl.textColor = UIColor.black
        tLbl.textAlignment = .center
        tLbl.font = UIFont.boldSystemFont(ofSize: 16)
        tStackView.addArrangedSubview(tLbl)
        return tStackView
    }
}

class StatusSectionGenerator {
    func generate() -> UIStackView {
        let stStackView = UIStackView()
        stStackView.axis = .vertical
        stStackView.distribution = .fill
        stStackView.spacing = 5
        
        var vGenerator : FieldValueViewGenerator!
        var sView : UIStackView!
        vGenerator = FieldValueViewGenerator(n:"Status: ")
        sView = vGenerator.generate()
        stStackView.addArrangedSubview(sView)
        
        return stStackView
    }
}

class ClaimDetailSectionGenerator {
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        //
        var vGenerator : FieldValueViewGenerator!
        var sView : UIStackView!
        vGenerator = FieldValueViewGenerator(n:"Claim Title")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        vGenerator = FieldValueViewGenerator(n:"Date")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        return stackView
    }
}

class buttonSectionGenerator {
    
    func generate() -> UIStackView {
        //
        let bStackView = UIStackView()
        bStackView.axis = .horizontal
        bStackView.distribution = .fill
        bStackView.spacing = 5
        let btn = UIButton()
        btn.setTitle("Add", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.contentEdgeInsets = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.blue.cgColor
        bStackView.addArrangedSubview(btn)
        return bStackView
    }
}

class ClaimDetailScreenGenerator {
    
    var root : UIView!
    var titleSecView : UIStackView!
    var detailSecView : UIStackView!
    var buttonSecView : UIStackView!
    var statusSecView : UIStackView!
    var vals : [UITextField]!
    var lbls : [UILabel]!
    var stLbl : [UILabel]!
    var statusMsg : [UITextField]!
    var nextBtn : UIButton!
    
    init(v : UIView) {
        root = v
    }
    
    func setStatusReference() {
        stLbl = [UILabel]()
        statusMsg = [UITextField]()
        
        for sv in statusSecView.arrangedSubviews {  // 3 of them
            let innerStackView = sv as! UIStackView
            for ve in innerStackView.arrangedSubviews { // 2 of them
                if ve is UITextField {
                    statusMsg.append(ve as! UITextField)
                } else {
                    stLbl.append(ve as! UILabel)
                }
            }
        }
        statusMsg[0].isUserInteractionEnabled = false
        statusMsg[0].backgroundColor = UIColor.clear
    }
    

    func setViewReference() {
        vals = [UITextField]()
        lbls = [UILabel]()
        //
        for sv in detailSecView.arrangedSubviews {  // 3 of them
            let innerStackView = sv as! UIStackView
            for ve in innerStackView.arrangedSubviews { // 2 of them
                if ve is UITextField {
                    vals.append(ve as! UITextField)
                } else {
                    lbls.append(ve as! UILabel)
                }
            }
        }
        print("UITextField references created.")
        
        // Make UITextField readonly
        for v in vals {
            v.isUserInteractionEnabled = true
        }
        
        //
        for sv in buttonSecView.arrangedSubviews {
            let btn = sv as! UIButton
            if btn.titleLabel?.text == "Add" {
                nextBtn = btn 
            }
        }
    }
    
    func setTitleSecConstraints() {
        titleSecView.translatesAutoresizingMaskIntoConstraints = false
        let topCont = titleSecView.topAnchor.constraint(equalTo: root.safeAreaLayoutGuide.topAnchor)
        let ldCont = titleSecView.leadingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.leadingAnchor)
        let trlCont = titleSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        titleSecView.layoutMargins = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        titleSecView.isLayoutMarginsRelativeArrangement = true
        topCont.isActive = true
        ldCont.isActive = true
        trlCont.isActive = true
    }
    
    func setDetailSecConstraints() {
        for i in 0...lbls.count-1 {
            lbls[i].setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            lbls[i].setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        let constr = lbls[0].widthAnchor.constraint(equalToConstant: root.frame.width * 0.25)
        constr.isActive = true
        //
        for i in 0...lbls.count-1 {
            lbls[i].translatesAutoresizingMaskIntoConstraints = false
            let constr = lbls[i].trailingAnchor.constraint(equalTo: lbls[0].trailingAnchor)
            constr.isActive = true
        }
        //
        for i in 0...vals.count-1 {
            //vals[i].setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            vals[i].setContentHuggingPriority(.defaultLow, for: .horizontal)
        }
        detailSecView.translatesAutoresizingMaskIntoConstraints = false
        let tCont = detailSecView.topAnchor.constraint(equalTo: titleSecView.bottomAnchor)
        let lCont = detailSecView.leadingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.leadingAnchor)
        let trCont = detailSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        detailSecView.layoutMargins = UIEdgeInsets(top: 40, left:20, bottom: 40, right: 20)
        detailSecView.isLayoutMarginsRelativeArrangement = true
        tCont.isActive = true
        lCont.isActive = true
        trCont.isActive = true
    }
    
    func setButtonSecConstraints() {
        buttonSecView.translatesAutoresizingMaskIntoConstraints = false
        let tpConst = buttonSecView.topAnchor.constraint(equalTo: detailSecView.bottomAnchor)
        let trConst = buttonSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        buttonSecView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        buttonSecView.isLayoutMarginsRelativeArrangement = true
        tpConst.isActive = true
        trConst.isActive = true
    }
    
    func setStatusSecContraints() {
        stLbl[0].setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        stLbl[0].setContentHuggingPriority(.defaultHigh, for: .horizontal)

        //let constr = lbls[0].widthAnchor.constraint(equalToConstant: root.frame.width * 0.25)
        //constr.isActive = true
        //

        stLbl[0].translatesAutoresizingMaskIntoConstraints = false
        let constr = stLbl[0].trailingAnchor.constraint(equalTo: stLbl[0].trailingAnchor)
        constr.isActive = true

        //
        statusMsg[0].setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        statusSecView.translatesAutoresizingMaskIntoConstraints = false
        let tpConst1 = statusSecView.topAnchor.constraint(equalTo: buttonSecView.bottomAnchor)
        let lCont1 = detailSecView.leadingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.leadingAnchor)
        let trConst1 = buttonSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        statusSecView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
        statusSecView.isLayoutMarginsRelativeArrangement = true
        tpConst1.isActive = true
        trConst1.isActive = true
        lCont1.isActive = true
    }
    
    func generate() {
        //
        titleSecView = TitleGenerator().generate()
        root.addSubview(titleSecView)
        setTitleSecConstraints()
        
        detailSecView = ClaimDetailSectionGenerator().generate()
        print("Detail section was created. ")
        buttonSecView = buttonSectionGenerator().generate()
        print("Button section was created. ")
        root.addSubview(detailSecView)
        root.addSubview(buttonSecView)
        
        statusSecView = StatusSectionGenerator().generate()
        root.addSubview(statusSecView)
        setStatusReference()
        setStatusSecContraints()

        //
        setViewReference()
        print("setViewReference() called.")

        
        // set constraints for detailSecView
        setDetailSecConstraints()
        print("setDetailSecConstraints() called.")
        
        // set constraints for buttonSecView
        setButtonSecConstraints()
        print("setButtonSecConstraints() called.")
    }
}
