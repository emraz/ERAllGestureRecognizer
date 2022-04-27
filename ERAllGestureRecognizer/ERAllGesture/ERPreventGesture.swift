//
//  ERPreventGesture.swift
//  ERAllGestureRecognizer
//
//  Created by Mahmudul Hasan Razib on 4/27/22.
//

import Foundation
import UIKit

/*
 The gesture in superView may eat event of the subView, and in snapchat example, the gesture will eat event of the toolbar, we need prevent any gesture recognition from superview if we are touching the toolbar.
 
 The idea is to add a pseduo customized gesture to the toolbar, so any gesture will be prevented to superview, and this pseduo gesture do nothing but deliver the gesture or event to subviews or its own view.
 */

//Usage: toolbarView.addGestureRecognizer(SnapBlockGestureRecognizer)


class ERPreventGesture: UIGestureRecognizer {

    init() {
        //self.init(target: self, action: #selector(__dummyAction))
        super.init(target: nil, action: nil)

        self.addTarget(self, action: #selector(__dummyAction))
        self.cancelsTouchesInView = false
    }

    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)

        self.cancelsTouchesInView = false
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        if self.state == .possible {
            self.state = .began
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        self.state = .recognized
    }

    override func canBePrevented(by preventingGestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.isGestureRecognizerAllowed(gr:preventingGestureRecognizer)
    }


    override func canPrevent(_ preventedGestureRecognizer: UIGestureRecognizer) -> Bool {
        return !(self.isGestureRecognizerAllowed(gr: preventedGestureRecognizer))
    }

    override func shouldBeRequiredToFail(by otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return !(self.isGestureRecognizerAllowed(gr: otherGestureRecognizer))
    }

    override func shouldRequireFailure(of otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }

    func isGestureRecognizerAllowed(gr: UIGestureRecognizer) -> Bool {
        return gr.view!.isDescendant(of: self.view!)
    }

    @objc func __dummyAction() {
        // do nothing
        // print("dummyAction")
    }
}
