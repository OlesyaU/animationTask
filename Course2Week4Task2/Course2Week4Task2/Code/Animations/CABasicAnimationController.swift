//
//  ViewController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CABasicAnimationController: UIViewController {
    
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var cyanView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var greenView: UIView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        addCyanTapGesureRecognizer()
        addOrangetapGestureRecognizer()
        addBlueTapGesureRecognizer()
        addGreenTapGesureRecognizer()
    }
    
    private func addOrangetapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CABasicAnimationController.tapOrangeView(_:)))
        orangeView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    private func addCyanTapGesureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CABasicAnimationController.cyanViewTapped))
        cyanView.addGestureRecognizer(tapGestureRecognizer)
    }
    private func addBlueTapGesureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CABasicAnimationController.blueViewTapped(_:)))
        blueView.addGestureRecognizer(tapGestureRecognizer)
    }
    private func addGreenTapGesureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CABasicAnimationController.greenViewTapped(_:)))
        greenView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func tapOrangeView(_ sender: UITapGestureRecognizer) {
        guard sender.state == .ended else {return}
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
        let value = orangeView.frame.width / 2
        animation.fromValue = orangeView.layer.cornerRadius
        animation.toValue = value
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        orangeView.layer.add(animation, forKey: nil)
        orangeView.layer.cornerRadius = value
    }
    
    
    @objc private func cyanViewTapped (_ sender: UITapGestureRecognizer) {
        guard sender.state == .ended else {return}
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        let value: Float = 0.0
        animation.fromValue = cyanView.layer.opacity
        animation.toValue = value
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        cyanView.layer.add(animation, forKey: nil)
        cyanView.layer.opacity = value
    }
    
    @objc private func blueViewTapped(_ sender: UITapGestureRecognizer) {
        guard sender.state == .ended else {return}
        let startPosition = (blueView.center.x, blueView.center.y)
        let finishPosition = CGPoint(x: cyanView.center.x,  y: blueView.center.y)
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0.0
        animation.toValue = 315 * Float.pi / 180
        
        let animation2 = CABasicAnimation(keyPath: "position")
        animation2.fromValue = startPosition
        animation2.toValue = finishPosition
        
        let groupAnimation  = CAAnimationGroup()
        groupAnimation.animations = [animation, animation2]
        groupAnimation.duration = 2.0
        groupAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        groupAnimation.fillMode = .forwards
        groupAnimation.isRemovedOnCompletion = false
        
        blueView.layer.add(groupAnimation, forKey: "groupAnimation")
    }
    
    @objc private func greenViewTapped(_ sender: UITapGestureRecognizer) {
        guard sender.state == .ended else {return}
        let scaleValue: CGFloat = 1.5
        let positionValue = view.center
        let colorFinish = UIColor.magenta.cgColor
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 1.0
        scaleAnimation.toValue = scaleValue
        
        let animationBacground = CABasicAnimation(keyPath: "backgroundColor")
        animationBacground.fromValue = greenView.backgroundColor?.cgColor
        animationBacground.toValue = colorFinish
        
        let positionAnimation = CABasicAnimation(keyPath: "position")
        positionAnimation.fromValue = greenView.center
        positionAnimation.toValue = positionValue
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [scaleAnimation, positionAnimation,animationBacground]
        groupAnimation.duration = 2.0
        groupAnimation.speed = 2.0
        groupAnimation.repeatCount = 2
        groupAnimation.autoreverses = true
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        greenView.layer.add(groupAnimation, forKey: "groupAnimation")
    }
}
