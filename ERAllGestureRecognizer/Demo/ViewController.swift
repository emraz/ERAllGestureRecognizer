//
//  ViewController.swift
//  ERAllGestureRecognizer
//
//  Created by Mahmudul Hasan Razib on 4/27/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var demoImageView: UIImageView!
   
    // define
    var erAllGesture: ERAllGesture?

    override func viewDidLoad() {
        super.viewDidLoad()
        // add gesture
        self.erAllGesture = ERAllGesture(view: demoImageView)

        //Advanced usage, for scenario that the view receiving gesture is background view:
        // add gesture
        //self.erAllGesture = ERAllGesture(transformView: self.demoImageView, gestureView: self.view)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // remove gesture
        self.erAllGesture = nil
    }
    
    @IBAction func didPressedAddSubView(_ sender: Any) {
        
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = UIColor.red
        self.view.addSubview(view)
        
    }
    
}

