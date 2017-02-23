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
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // We tried this option but it didn't appear to do anything
        //body.adjustsFontForContentSizeCategory = true
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(notificationCallbackWhenFontSizeDidChangeInAccessibility),
            name: NSNotification.Name.UIContentSizeCategoryDidChange,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(notificationCallbackWhenDarkerColorsDidChangeInAccessibility),
            name: NSNotification.Name.UIAccessibilityDarkerSystemColorsStatusDidChange,
            object: nil)
        
        print ("UIAccessibilityDarkerSystemColorsEnabled: \(UIAccessibilityDarkerSystemColorsEnabled())")
        print ("UIAccessibilityIsInvertColorsEnabled: \(UIAccessibilityIsInvertColorsEnabled())")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changeFontSize(_ sender: UIButton) {
        NotificationCenter.default.post(
            name: NSNotification.Name.UIContentSizeCategoryDidChange,
            object: nil,
            userInfo: [UIContentSizeCategoryNewValueKey: textField.text!])
    }
    
    func notificationCallbackWhenFontSizeDidChangeInAccessibility(notification: Notification) {
        // If using font styles (Apple's preference, then this is the way to update)
        //body.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        
        customSizeUpdateForBodyLabel(notification)
        self.view.setNeedsDisplay()
    }
    
    func customSizeUpdateForBodyLabel(_ notification: Notification) {
        let userNewValueSize = notification.userInfo?[UIContentSizeCategoryNewValueKey] as! String
        if (userNewValueSize == UIContentSizeCategory.extraSmall.rawValue) {
            body.font = body.font.withSize(14.0)
        } else if (userNewValueSize == UIContentSizeCategory.extraExtraExtraLarge.rawValue) {
            body.font = body.font.withSize(19.0)
        } else {
            body.font = body.font.withSize(16.0)
        }
    }
    
    func updateCustomFont() {
        let bodyFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        let currentFont = customFontLable.font
        
        customFontLable.font = UIFont(name: currentFont!.fontName, size: bodyFont.pointSize)
    }
    
    func notificationCallbackWhenDarkerColorsDidChangeInAccessibility(notification: Notification) {
        print ("notificationCallbackWhenDarkerColorsDidChangeInAccessibility | UIAccessibilityDarkerSystemColorsEnabled: \(UIAccessibilityDarkerSystemColorsEnabled())")
    }
    
}

