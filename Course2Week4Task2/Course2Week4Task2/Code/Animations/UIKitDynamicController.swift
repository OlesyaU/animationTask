//
//  UIKitDynamicController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIKitDynamicController: UIViewController {
    
    @IBOutlet weak var anchorView: UIView!
    @IBOutlet weak var animationView: UIView!
    private var dynamicAnimator: UIDynamicAnimator!
    private var attachment: UIAttachmentBehavior!
    private var gravity: UIGravityBehavior!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGestureRecognizer = UIPanGestureRecognizer(target: self,
                                                          action: #selector(self.panHandler(_:)))
        anchorView.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc private func panHandler(_ sender: UIPanGestureRecognizer) {
        let lenght = 107
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [animationView])
        
        let  itemBehaviour = UIDynamicItemBehavior(items: [animationView])
        attachment = UIAttachmentBehavior(item: animationView,
                                          attachedToAnchor: CGPoint(x: anchorView.center.x, y: anchorView.center.y))
        itemBehaviour.elasticity = 0.5
        itemBehaviour.allowsRotation = true
        attachment.length = CGFloat(lenght)
        attachment.anchorPoint = sender.location(in: view)
        anchorView.center = sender.location(in: view)
        
        dynamicAnimator.addBehavior(attachment)
        dynamicAnimator.addBehavior(gravity)
    }
}
