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
        
        func postSizeChange(_ fontSize: String) {
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
        }
        
        describe("Body Style Labels") {
            beforeEach {
                postSizeChange("UICTContentSizeCategoryM")
                expect(subject.body.font.pointSize).toEventually(beCloseTo(16.0), timeout: 1)
            }
            
            it("it can increase the size of the label when notified") {
                let previousFontSize = subject.body.font.pointSize
                
                postSizeChange("UICTContentSizeCategoryXXXL")
                
                expect(subject.body.font.pointSize).toEventually(beGreaterThan(previousFontSize), timeout: 1)
            }
            
            it("it can decrease the size of the label when notified") {
                let previousFontSize = subject.body.font.pointSize
                
                postSizeChange("UICTContentSizeCategoryXS")
                
                expect(subject.body.font.pointSize).toEventually(beLessThan(previousFontSize), timeout: 1)
            }
        }
    }
    
}
