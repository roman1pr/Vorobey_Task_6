//
//  ViewController.swift
//  Vorobey_Task_6
//
//  Created by Roman Priiskalov on 18.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var squareView = {
        let view = UIView()
        
        view.frame = CGRect(x: 0, y: 0, width: 75, height: 75)
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 4
        return view
    }()
    
    private lazy var animator: UIDynamicAnimator = UIDynamicAnimator(referenceView: view)
//    private lazy var gravity: UIGravityBehavior = UIGravityBehavior(items: [squareView])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(squareView)
        
        squareView.center = view.center
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector(self.onTap))
        self.view.addGestureRecognizer(tapGestureRecognizer)
//        gravity.addBehavior(gravity)
    }

    @objc func onTap(sender: UITapGestureRecognizer) {
        animator.removeAllBehaviors()

        let tapLocation = sender.location(in: view)
        let snap = UISnapBehavior(item: squareView, snapTo: tapLocation)
 
        animator.addBehavior(snap)
    }

}
