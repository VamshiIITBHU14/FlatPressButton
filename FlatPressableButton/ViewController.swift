//
//  ViewController.swift
//  FlatPressableButton
//
//  Created by Priyanka Pote on 16/11/17.
//  Copyright © 2017 VamshiKrishna. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       self.view.backgroundColor = UIColor.ht_alizarinColor()
        
        //Rect button
        var frame = CGRect(x: 30, y: 150, width: 260, height: 50)
        let rectButton = HTPressableButton(frame: frame, buttonStyle: HTPressableButtonStyle.rect)
        rectButton.buttonColor = UIColor.ht_alizarinColor()
        rectButton.shadowColor = UIColor.ht_pumpkinColor()
        rectButton.setTitle("Rect", for: .normal)
        view.addSubview(rectButton)

        // Rounded rectangular button
        frame = CGRect(x: 30, y: 230, width: 260, height: 50)
        let roundedRectButton = HTPressableButton(frame: frame, buttonStyle: HTPressableButtonStyle.rounded)
        roundedRectButton.setTitle("Rounded", for: .normal)
        view.addSubview(roundedRectButton)
        
        //Circular button
        frame = CGRect(x: 110, y: 300, width: 100, height: 100)
        let circularButton = HTPressableButton(frame: frame, buttonStyle: HTPressableButtonStyle.circular)
        circularButton.buttonColor = UIColor.ht_carrotColor()
        circularButton.shadowColor = UIColor.ht_midnightBlue()
        circularButton.disabledButtonColor = UIColor.ht_everaldColor()
        circularButton.setTitle("Circular", for: .normal)
        view.addSubview(circularButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

