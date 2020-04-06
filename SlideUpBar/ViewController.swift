//
//  ViewController.swift
//  SlideUpBar
//
//  Created by Beka Demuradze on 2/27/20.
//  Copyright © 2020 Beka Demuradze. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    var value: CGFloat = 0
    let arrowAnimation = AnimationView(name: "arrow2")
    
    let topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = .white
        return topView
    }()
    
    let bottomControlls = BottomControls()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(bottomControlls)
        bottomControlls.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 15, bottom: 10, right: 15))
        view.addSubview(topView)
        topView.fillSuperview()
        view.bringSubviewToFront(topView)
        topView.layer.shadowColor = UIColor.black.cgColor
        topView.layer.shadowOpacity = 1
        topView.layer.shadowOffset = .init(width: 0, height: -10)
        topView.layer.shadowRadius = 20
        topView.addSubview(arrowAnimation)
        arrowAnimation.center = view.center
        arrowAnimation.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 185, bottom: 35, right: 185))
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(draging))
        topView.addGestureRecognizer(panGesture)
    }
    
    @objc func draging(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            if value == 0 {
                slidingUp(gesture)
            } else {
                slidingDown(gesture)
            }
        case.ended:
            finishSliding(gesture)
        default:
            ()
        }
    }
    
    func slidingUp(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: nil)
        let move: CGFloat = translation.y
        if move > 0 {
            self.topView.transform = CGAffineTransform(translationX: 0, y: max(move - move, -120))
        } else {
            self.topView.transform = CGAffineTransform(translationX: 0, y: max(move, -120))
        }
    }
    
    func slidingDown(_ gesture: UIPanGestureRecognizer){
        let translation = gesture.translation(in: nil)
        let move: CGFloat = translation.y
        self.topView.transform = CGAffineTransform(translationX: 0, y: -120)
        
        if move > 0 {
            self.topView.transform = CGAffineTransform(translationX: 0, y: min(0, -120 + move))
        }
    }
    
    func finishSliding(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: nil)
        let move: CGFloat = translation.y
        if move < -50 {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                self.topView.transform = CGAffineTransform(translationX: 0, y: -120)
            })
            value = 1
            arrowAnimation.play(toFrame: 20)
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                self.topView.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            arrowAnimation.play(fromFrame: 20, toFrame: 68)
            value = 0
        }
    }
}

