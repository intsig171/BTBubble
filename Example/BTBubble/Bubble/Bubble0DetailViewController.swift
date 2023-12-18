//
//  BubbleDetailViewController.swift
//  BTMaterial_Example
//
//  Created by qixin on 2023/2/1.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import BTBubble

class Bubble0DetailViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        view.addSubview(showButton)
        view.addSubview(showButton1)

        view.addSubview(showButton2)
        view.addSubview(showButton3)
    }
    
    
    lazy var showButton: UIButton = {
        let btn = UIButton.init(type: .contactAdd)
        btn.backgroundColor = UIColor.red
        btn.frame = CGRect(x: UIDevice.width-40, y: 100, width: 40, height: 40)
        btn.addTarget(self, action: #selector(event(sender: )), for: .touchUpInside)
        return btn
    }()
    
    lazy var showButton1: UIButton = {
        let btn = UIButton.init(type: .contactAdd)
        btn.backgroundColor = UIColor.red
        btn.frame = CGRect(x: 0, y: 200, width: 40, height: 40)
        btn.addTarget(self, action: #selector(event1(sender: )), for: .touchUpInside)
        return btn
    }()
    
    lazy var showButton2: UIButton = {
        let btn = UIButton.init(type: .contactAdd)
        btn.backgroundColor = UIColor.red
        btn.frame = CGRect(x: UIDevice.width - 21 - 40, y: 300, width: 40, height: 40)
        btn.addTarget(self, action: #selector(event2(sender: )), for: .touchUpInside)
        return btn
    }()

    lazy var showButton3: UIButton = {
        let btn = UIButton.init(type: .contactAdd)
        btn.backgroundColor = UIColor.red
        btn.frame = CGRect(x: UIDevice.width - 50 - 40, y: 400, width: 40, height: 40)
        btn.addTarget(self, action: #selector(event3(sender: )), for: .touchUpInside)
        return btn
    }()
    
    @objc func event3(sender: UIButton) {
        let bubble = BTBubble()
        bubble.arrowOffset = .auto(20)
        bubble.show(text: "这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡", direction: .right, maxWidth: 200, from: sender)
    }
    
    @objc func event1(sender: UIButton) {
        let bubble = BTBubble()
        bubble.arrowOffset = .center(0)
        bubble.show(text: "这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡", direction: .down, maxWidth: 200, from: sender)
    }
    
    
    @objc func event2(sender: UIButton) {
        let bubble = BTBubble()
        bubble.arrowOffset = .after(20)
        bubble.show(text: "这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡", direction: .left, maxWidth: 200, from: sender)
    }
    
    @objc func event(sender: UIButton) {
        
        let bubble = BTBubble()
        bubble.arrowOffset = .before(20)
        bubble.tapTargetHandler = { _ in
            self.showButton.backgroundColor = UIColor.orange
        }
        
        bubble.tapOutsideHandler = { _ in
            print("点击外面的回调")
        }

        let tag = sender.tag
        
        
        
        
        switch tag {
        case 0:
            bubble.bubbleColor = UIColor.white
            
            bubble.cornerRadius = 4
            
            bubble.borderColor = UIColor.clear
            
            bubble.borderWidth = 1
            
            bubble.shadowColor = UIColor.gray
            
            bubble.shadowOffset = CGSize(width: 0, height: 0)
            
            bubble.shadowOpacity = 0.3
            
            bubble.edgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            
        case 1:
            bubble.font = UIFont.systemFont(ofSize: 16)
            bubble.textColor = UIColor.systemBlue
            bubble.textAlignment = .center
            
        case 2:
            bubble.maskColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
            bubble.shouldShowMask = true
            bubble.shouldCutoutMask = true
            
            
        case 3:
//            bubble.arrowSize = CGSize(width: 50, height: 20)
//            bubble.arrowRadius = 10
//            bubble.arrowOffset = .auto(20)
            break
            
        case 4:
            
            bubble.entranceAnimation = .fadeIn
            bubble.exitAnimation = .fadeOut
            
            
        case 5:
            bubble.entranceAnimation = .scale
            bubble.exitAnimation = .scale
            
        case 6:
            bubble.actionAnimation = .bounce(1.4)
            
            
        case 7:
            bubble.entranceAnimation = .custom
            bubble.exitAnimation = .custom
            
            bubble.entranceAnimationHandler = { completion in
                bubble.transform = CGAffineTransform(rotationAngle: 1)
                UIView.animate(withDuration: 0.5, animations: {
                    bubble.transform = .identity
                }, completion: { (_) in
                    /// 一定要有回调
                    completion()
                })
            }
            
            bubble.exitAnimationHandler = { completion in
                let ani: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.rotation")
                ani.values = [-Double.pi/180*4,Double.pi/180*4,-Double.pi/180*4]
                ani.repeatCount = 10
                bubble.layer.add(ani, forKey: "shakeAnimation")
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    bubble.entranceAnimation = .scale
                    bubble.exitAnimation = .scale
                    /// 一定要有回调
                    completion()
                }
            }
        case 8:
//            bubble.arrowOffset = .auto(10)
            break
        default:
            break
        }
        
        
        bubble.show(text: "这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡这是一个气泡", direction: .right, maxWidth: 200, from: sender)

        
    }

}
