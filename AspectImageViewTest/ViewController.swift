//
//  ViewController.swift
//  AspectImageViewTest
//
//  Created by Charlie Hieger on 11/16/16.
//  Copyright © 2016 Charlie Hieger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aspectImageView: FlexibleAspectImageView!

    var originalFrame: CGRect!
    override func viewDidLoad() {
        super.viewDidLoad()
        originalFrame = aspectImageView.frame
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func slider(_ sender: UISlider) {

        let value = CGFloat(sender.value)

        aspectImageView.frame.size.width = originalFrame.size.width + value
    }


    @IBAction func didAdjustHeight(_ sender: UISlider) {
        let value = CGFloat(sender.value)

        aspectImageView.frame.size.height = originalFrame.size.height + value

    }

    @IBAction func didAdjustOrigin(_ sender: UISlider) {
        let value = CGFloat(sender.value)

        aspectImageView.frame.origin = CGPoint(x: originalFrame.origin.x + value, y: originalFrame.origin.y + value)


    }
}

