//
//  ViewControllerSpec.swift
//  SpecTools
//
//  Created by Ondrej Rafaj on 25/08/2017.
//  Copyright © 2017 manGoweb. All rights reserved.
//

import Foundation
import UIKit
import Quick
import Nimble
import SpecTools

@testable import SpecToolsExample


class ViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        let subject = ViewController()
        
        describe("basic view controller") {
            beforeEach {
                subject.spec.prepare.simulatePresentViewController()
                subject.spec.prepare.set(viewSize: .iPhone6)
                
            }
            
            fit("has a visible label1") {
                let element = subject.view.spec.find.first(labelWithText: "My first label")
                expect(element?.spec.check.isVisible(visualize: .text)).to(beTrue())
            }
            
            it("has a visible scrollView") {
                let element = subject.view.spec.find.firstScrollView()
                expect(element?.spec.check.isVisible()).to(beTrue())
            }
            
            it("has a visible label2", closure: { 
                let element = subject.view.spec.find.first(labelWithText: "My second label sitting in a scrollview")
                expect(element?.spec.check.isVisible(visualize: .text)).to(beTrue())
            })
            
        }
        
    }
    
}
