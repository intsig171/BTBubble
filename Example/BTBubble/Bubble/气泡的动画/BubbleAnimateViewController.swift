//
//  BubbleAnimateViewController.swift
//  BTBubble_Example
//
//  Created by qixin on 2023/12/19.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

import BTBubble

class BubbleAnimateViewController: BubbleBaseViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        isAutoShowBubble = false
        
        button.addTarget(self, action: #selector(animateEvent), for: .touchUpInside)
        view.addSubview(button)
        button.snp.updateConstraints { make in
            make.top.equalTo(500)
        }
        
        initUI()
        
    }
    
    lazy var enterSegment: UISegmentedControl = {
        let items = ["进入动画选项", "缩放", "淡入", "自定义", "禁止"]
        let segmented = UISegmentedControl(items: items)
        segmented.selectedSegmentIndex = 1
        segmented.setEnabled(false, forSegmentAt: 0)
        segmented.setWidth(100, forSegmentAt: 0)
        return segmented
    }()
    
    lazy var showSegment: UISegmentedControl = {
        let items = ["动作动画选项", "弹性", "浮动", "脉冲", "禁止"]
        let segmented = UISegmentedControl(items: items)
        segmented.setEnabled(false, forSegmentAt: 0)
        segmented.setWidth(100, forSegmentAt: 0)
        segmented.selectedSegmentIndex = 1
        return segmented
    }()
    
    lazy var dismissSegment: UISegmentedControl = {
        let items = ["退出动画选项", "缩放", "淡出", "自定义", "禁止"]
        let segmented = UISegmentedControl(items: items)
        segmented.setEnabled(false, forSegmentAt: 0)
        segmented.setWidth(100, forSegmentAt: 0)
        segmented.selectedSegmentIndex = 1
        return segmented
    }()
}

extension BubbleAnimateViewController {

    @objc func animateEvent() {
        
        bubble.animationIn = 2
        bubble.delayIn = 0.2
        
        bubble.animationOut = 2
        bubble.delayOut = 0.2
        
        
        
        switch enterSegment.selectedSegmentIndex {
        case 1:
            bubble.entranceAnimation = .scale
        case 2:
            bubble.entranceAnimation = .fadeIn
        case 3:
            bubble.entranceAnimation = .custom
            bubble.entranceAnimationHandler = { [weak bubble] completion in
                bubble?.transform = CGAffineTransform(rotationAngle: 1)
                UIView.animate(withDuration: 0.5, animations: {
                    bubble?.transform = .identity
                }, completion: { (_) in
                    /// 一定要有回调
                    completion()
                })
            }
        case 4:
            bubble.entranceAnimation = .none
        default:
            break
        }
        
        
        switch showSegment.selectedSegmentIndex {
        case 1:
            bubble.actionAnimation = .bounce(2)
        case 2:
            bubble.actionAnimation = .float(offsetX: 2, offsetY: 2)
        case 3:
            bubble.actionAnimation = .pulse(1.2)
        case 4:
            bubble.actionAnimation = .none
        default:
            break
        }
        
        
        switch dismissSegment.selectedSegmentIndex {
        case 1:
            bubble.exitAnimation = .scale
        case 2:
            bubble.exitAnimation = .fadeOut
        case 3:
            bubble.exitAnimation = .custom
            bubble.exitAnimationHandler = { [weak bubble] completion in
                let ani: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.rotation")
                ani.values = [-Double.pi/180*4,Double.pi/180*4,-Double.pi/180*4]
                ani.repeatCount = 10
                bubble?.layer.add(ani, forKey: "shakeAnimation")
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    bubble?.entranceAnimation = .scale
                    bubble?.exitAnimation = .scale
                    /// 一定要有回调
                    completion()
                }
            }
        case 4:
            bubble.exitAnimation = .none
        default:
            break
        }
        
        bubble.show(text: "明亮的月光洒在窗户纸上，好像地上泛起了一层白霜。我抬起头来，看那天窗外空中的明月，不由得低头沉思，想起远方的家乡。", from: button)
    }
}


extension BubbleAnimateViewController {
    func initUI() {
        view.addSubview(enterSegment)
        enterSegment.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.top.equalTo(100)
            make.height.equalTo(50)
        }
        
        view.addSubview(showSegment)
        showSegment.snp.makeConstraints { make in
            make.left.right.height.equalTo(enterSegment)
            make.top.equalTo(enterSegment.snp.bottom).offset(8)
        }
        
        view.addSubview(dismissSegment)
        dismissSegment.snp.makeConstraints { make in
            make.left.right.height.equalTo(enterSegment)
            make.top.equalTo(showSegment.snp.bottom).offset(8)
        }
    }
}
