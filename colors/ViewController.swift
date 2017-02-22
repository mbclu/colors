//
//  ViewController.swift
//  colors
//
//  Created by Mitch Clutter on 2/22/17.
//  Copyright © 2017 Mitch Clutter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var customFontLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        body.adjustsFontForContentSizeCategory = true
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(ViewController.preferredContentSizeDidChange),
            name: NSNotification.Name.UIContentSizeCategoryDidChange,
            object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        if previousTraitCollection?.preferredContentSizeCategory != traitCollection.preferredContentSizeCategory {
//            print("previousTraitCollection?.preferredContentSizeCategory: \(previousTraitCollection?.preferredContentSizeCategory)")
//            print("traitCollection?.preferredContentSizeCategory: \(traitCollection.preferredContentSizeCategory)")
//
//        }
//    }
    
    override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        body.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        
//        updateCustomFont()

        self.view.setNeedsDisplay()
    }
    
    func updateCustomFont() {
        let bodyFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        let currentFont = customFontLable.font
        
        customFontLable.font = UIFont(name: currentFont!.fontName, size: bodyFont.pointSize)
    }


}

