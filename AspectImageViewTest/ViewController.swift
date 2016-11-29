//
//  ViewController.swift
//  AspectImageViewTest
//
//  Created by Charlie Hieger on 11/16/16.
//  Copyright © 2016 Charlie Hieger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Toggle {
        case on
        case off
    }

    var effectView: UIVisualEffectView!
    var thumbNailFrame: CGRect!
    var toggle: Toggle = .off

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapImage(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! FlexibleAspectImageView

        switch toggle {
        case .off:
            toggle = .on
            thumbNailFrame = imageView.frame
            let fullScreenFrame = view.frame
            effectView = UIVisualEffectView()
            effectView.frame = view.bounds
            view.addSubview(effectView)
            view.bringSubview(toFront: imageView)
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: { 
                imageView.frame = fullScreenFrame
                imageView.setFlexibleAspectFit()
                self.effectView.effect = UIBlurEffect(style: .dark)
            }, completion: nil)
        case .on:
            toggle = .off
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: { 
                imageView.frame = self.thumbNailFrame
                imageView.setFlexibleAspectFill()
                self.effectView.effect = nil
            }, completion: { (Bool) in
                self.effectView.removeFromSuperview()
            })
        }
    }
}

