//
//  CAKeyframeAnimationController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CAKeyframeAnimationController: UIViewController {
    
    @IBOutlet weak var passcodeTextField: UITextField!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var startShakeAnimationButton: UIButton!
    @IBOutlet weak var startSinAnimationButton: UIButton!
    
    @IBAction func shakeAnimationTapHandler(sender: UIButton) {
        let snakeAnimation = CAKeyframeAnimation(keyPath: "position.x")
        snakeAnimation.values = [0, 10, -10, 10, -5, 5, -5, 0]
        snakeAnimation.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.8, 1]
        snakeAnimation.duration = 0.4
        snakeAnimation.isAdditive = true
        passcodeTextField.layer.add(snakeAnimation, forKey: "position.x")
    }
    
    @IBAction func sinAnimationTapHandler(sender: UIButton) {
        let sinAnimation = CAKeyframeAnimation(keyPath: "position")
        sinAnimation.path = sinPath()
        sinAnimation.repeatCount = .infinity
        sinAnimation.calculationMode = .cubic
        sinAnimation.duration = 6.0
        sinAnimation.rotationMode = .rotateAutoReverse
        orangeView.layer.add(sinAnimation, forKey: "position")
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passcodeTextField.resignFirstResponder()
        showSinPath()
    }
}

extension CAKeyframeAnimationController {
    private func showSinPath() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = sinPath()
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        view.layer.addSublayer(shapeLayer)
    }
    
    private func sinPath() -> CGPath {
        let startPoint = orangeView.center
        let width = self.view.bounds.width - 2 * startPoint.x
        let height = self.view.bounds.height / 6.0
        return CGPath.sinPath(startPoint: startPoint, width: width, height: height, periods: 1.5)
    }
}
//Второй тип анимации - CAKeyframeAnimation, которой соответствует CAKeyframeAnimationController. У этого контроллера имеется два аутлета: passcodeTextField и orangeView. По нажатию на кнопку Start shake animation passcodeTextField должен воспроизвести т.н. shake - анимацию, имитирующую неверный ввод пароля. Смещение passcodeTextField должно происходить вдоль оси Х со следующими значениями: 0, 10, -10, 10, -5, 5, -5, 0. Временные интервалы для этой анимации: 0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.8, 1. Общая длительность анимации 0.4 секунды. Небольшая подсказка: обратите внимание на свойство isAdditive при реализации этой анимации. По нажатию на кнопку Start sin animation центр orangeView должен начать перемещение по заранее нарисованной с помощью метода showSinPath() синусоиде. Анимация должна быть бесконечной, длительность одного цикла анимации - 6 секунд. При перемещении вдоль синусоиды orangeView должен поворачиваться так, чтобы ось Х orangeView всегда была параллельна касательной в любой точке синусоиды.
