//
//  CATransitionController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CATransitionController: UIViewController {
        
    enum AnimState {
        case initial
        case sliding
    }
    
    var animState: AnimState!
    
    @IBOutlet weak var textLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backFirstText()
        
        let swipeGestureRecognizer = UIGestureRecognizer(target: self, action: #selector(self.swipeHandler(_:)))
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    @IBAction func swipeHandler(_ sender: UISwipeGestureRecognizer) {
        guard sender.state == .ended else {return}
        
        switch animState! {
        case .initial:
            changeText()
        case .sliding:
            backFirstText()
        }
    }
    
    private func changeText() {
        let animation = CATransition()
        animation.duration = 1.0
        animation.type = .moveIn
        animation.timingFunction = .init(name: .easeOut)
        textLabel.text = "Sliding!"
        textLabel.textColor = .green
        textLabel.layer.add(animation, forKey: "color")
        
        animState = .sliding
    }
    
    private func backFirstText() {
        let animation2 = CATransition()
        animation2.type = .fade
        animation2.duration = 1.0
        animation2.timingFunction = .init(name: .easeOut)
        textLabel.text = "Initial text"
        textLabel.textColor = .orange
        textLabel.layer.add(animation2, forKey: "fade")
        
        animState = .initial
        

    }
}
//ледующий тип анимации - CATransition, которой соответствует CATransitionController. У этого контроллера имеется один аутлет textLabel с текстом “Initial text” оранжевого цвета. Нужно сделать так, чтобы по свайпу в корневом view слева направо текст анимированно менялся на “Sliding!” со следующими параметрами: transition type - kCATransitionMoveIn, цвет текста .green, длительность анимации - 1 секунда, timingFunction - kCAMediaTimingFunctionEaseOut. По окончании этой анимации текст должен анимированно поменяться на первоначальный, параметры этой анимации следующие: transition type - kCATransitionFade, цвет текста .orange, длительность анимации - 1 секунда, timingFunction - kCAMediaTimingFunctionEaseOut. На корневой view в storyboard уже добавлен UISwipeGestureRecognizer. Вам нужно только добавить метод для обработки этого жеста.
