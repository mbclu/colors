//
//  colorsTests.swift
//  colorsTests
//
//  Created by Mitch Clutter on 2/22/17.
//  Copyright © 2017 Mitch Clutter. All rights reserved.
//

import Quick
import Nimble
@testable import colors

class colorsTests: QuickSpec {
    override func spec() {
        var subject: ViewController!
        
        func postSizeChange(_ fontSize: UIContentSizeCategory) {
            NotificationCenter.default.post(
                name: NSNotification.Name.UIContentSizeCategoryDidChange,
                object: nil,
                userInfo: [UIContentSizeCategoryNewValueKey: fontSize])
        }
        
        beforeEach {
            super.setUp()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            subject = storyboard.instantiateInitialViewController() as! ViewController
            expect(subject.view).notTo(beNil())
            postSizeChange(UIContentSizeCategory.extraSmall)
        }
        
        describe("Body Style Labels") {
            it("it can increase the size of the label when notified") {
                let previousFontSize = subject.body.font.pointSize
                
                postSizeChange(UIContentSizeCategory.accessibilityExtraExtraExtraLarge)
                
                let newFontSize = subject.body.font.pointSize
                
                expect(newFontSize).to(beGreaterThan(previousFontSize))
            }
        }
    }
    
    
//    func testBodyStyleLabelsDecreasesInSizeWhenNotified() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let subject = storyboard.instantiateInitialViewController() as! ViewController
//        
//        NotificationCenter.default.post(
//            name: NSNotification.Name.UIContentSizeCategoryDidChange,
//            object: UIContentSizeCategory.accessibilityExtraExtraLarge)
//        
//        expect(subject.view).notTo(beNil())
//        
//        let fontSizeLabel = subject.body.font.pointSize
//        
//        NotificationCenter.default.post(
//            name: NSNotification.Name.UIContentSizeCategoryDidChange,
//            object: UIContentSizeCategory.accessibilityMedium)
//        
//        expect(subject.body.font.pointSize).to(beLessThan(fontSizeLabel))
//    }
    
}
