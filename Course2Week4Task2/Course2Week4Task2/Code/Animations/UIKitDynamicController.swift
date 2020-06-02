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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.panHandler(_:)))
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc private func panHandler(_ sender: UIPanGestureRecognizer) {
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        let point = sender.location(in: anchorView)
        let centerPoint = anchorView.center
        
        let snap = UISnapBehavior(item: anchorView, snapTo: anchorView.center)
        let attache = UIAttachmentBehavior(item: animationView, attachedToAnchor:centerPoint)
        let pushBehaviour = UIPushBehavior(items: [animationView], mode: .continuous)
        let gravity = UIGravityBehavior(items: [animationView])
        let itemBehaviour = UIDynamicItemBehavior(items: [animationView])
        itemBehaviour.elasticity = 0.5
        itemBehaviour.allowsRotation = true
        
        dynamicAnimator.addBehavior(attache)
        dynamicAnimator.addBehavior(pushBehaviour)
        dynamicAnimator.addBehavior(gravity)
        dynamicAnimator.addBehavior(snap)
        
    }
}
//Последний тип анимации - UIKitDynamic, ему соответствует UIKitDynamicController. У этого контроллера имеется два аутлета: anchorView и animationView. Кроме того, на anchorView view добавлен UIPanGestureRecognizer. Необходимо реализовать анимацию свободных колебаний animationView вокруг anchorView (подсказка: обратите внимание на UIAttachmentBehavior). Кроме того, должна быть реализована возможность перемещать anchorView пальцем по экрану с сохранением свободных колебаний.
