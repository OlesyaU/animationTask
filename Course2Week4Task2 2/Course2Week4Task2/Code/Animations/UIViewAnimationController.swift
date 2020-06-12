//
//  UIViewAnimationController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIViewAnimationController: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var flipButton: UIButton!
    
    enum State {
        case normal
        case rotated
    }
    
    var state: State!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        state = .normal
        
        let tapGestureRecognizer = UITapGestureRecognizer (target: self, action: #selector(self.animationViewTapHandler(sender:)))
        animationView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @IBAction func animationViewTapHandler(sender: UITapGestureRecognizer) {
        guard sender.state == .ended else{return}
        
        UIView.animate(withDuration: 1.0, delay: 0.5, options: [.curveEaseOut], animations: {
            self.animationView.transform = CGAffineTransform(rotationAngle: .pi)
            self.animationView.center.x = self.view.bounds.width - self.animationView.bounds.width / 2
        })
    }
    
    @IBAction func flipButtonTapHandler(sender: UIButton) {
        switch self.state! {
        case .normal:
            rotateFromNormal()
        case .rotated:
            backRotate()
        }
    }
    
    private func rotateFromNormal() {
        UIView.transition(with: self.view, duration: 1.0, options: [.curveEaseOut, .layoutSubviews], animations: {
            self.view.transform = CGAffineTransform(rotationAngle: .pi)
            self.flipButton.transform = CGAffineTransform(rotationAngle: .pi )
        })
        
        state = .rotated
    }
    
    private func backRotate() {
        UIView.transition(with: self.view, duration: 1.0, options: [.curveEaseOut, .layoutSubviews], animations: {
            self.view.transform = CGAffineTransform(rotationAngle: .pi * 2)
            self.flipButton.transform = CGAffineTransform(rotationAngle: .pi * 2)
        })
        
        state = .normal
    }
}


//Следующий тип анимации основан на использовании статических методов UIView. Контроллер - UIViewAnimationController. В нём имеется два аутлета: animationView и flipButton. UITapGestureRecognizer добавлен на animationView в storyboard. Тап по animationView должен анимированно переместить его вдоль оси Х с одновременным поворотом на 180° по часовой стрелке вокруг оси Z. По окончании анимации правый край animationView и правый край корневого view должны совпадать. Параметры анимации следующие: длительность анимации одна секунда, задержка перед началом - 0.5 секунды, UIViewAnimationOptions - curveEaseInOut. Нажатие на кнопку flip каждый раз должно анимированно вращать корневой view и саму кнопку на 180° вокруг оси Z по часовой стрелке. Параметры анимации: длительность анимации одна секунда, UIViewAnimationOptions - curveEaseInOut.


