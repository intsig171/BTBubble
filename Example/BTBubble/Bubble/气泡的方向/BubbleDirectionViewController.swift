//
//  BubbleViewController.swift
//  BTMaterial_Example
//
//  Created by qixin on 2022/11/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import BTBubble

class BubbleDirectionViewController: BubbleBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        baseSetting()
        loadDirectionUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        bubble.show(text: "将进酒 - 李白", direction: .up, from: centerButton)
    }

    
    
    lazy var bgScrollView: UIScrollView = {
        let sc = UIScrollView()
        sc.contentSize = CGSize(width: UIDevice.width, height: UIDevice.height * 1.5)
        sc.showsVerticalScrollIndicator = true
        
        return sc
    }()
    
    
    lazy var topButton: UIButton = createDirectionButton(tag: 0, text: "上")
    lazy var leftButton: UIButton = createDirectionButton(tag: 1, text: "左")
    lazy var rightButton: UIButton = createDirectionButton(tag: 2, text: "右")
    lazy var bottomButton: UIButton = createDirectionButton(tag: 3, text: "下")
    lazy var centerButton: UIButton = createDirectionButton(tag: 4, text: "中")
}

extension BubbleDirectionViewController {
    

    
    
 
    func update() {

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            self.bubble.show(text: "将进酒 - 李白", direction: .up, maxWidth: 200, from: self.centerButton)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                self.bubble.show(text: "人生得意须尽欢", direction: .down, maxWidth: 200, from: self.bottomButton)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                    self.bubble.show(text: "莫使金樽空对月", direction: .left, maxWidth: 200, from: self.leftButton)
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                        self.bubble.show(text: "天生我材必有用", direction: .up, maxWidth: 200, from: self.topButton)
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                            self.bubble.show(text: "千金散尽还复来", direction: .right, maxWidth: 200, from: self.rightButton)
                        }
                    }
                }
            }
        }
        
        
    }
}


extension BubbleDirectionViewController {
    
    func createDirectionButton(tag: Int, text: String) -> UIButton {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = UIColor.orange
        btn.layer.cornerRadius = 30
        btn.layer.masksToBounds = true
        btn.setTitle(text, for: .normal)
        btn.tag = tag
        btn.addTarget(self, action: #selector(directionButtonEvent), for: .touchUpInside)
        
        return btn
    }
    
    
    func loadDirectionUI() {
        let wh = CGSize(width: 60, height: 60)
                        
        bgScrollView.addSubview(centerButton)
        centerButton.snp.makeConstraints {
            $0.centerX.equalTo(UIDevice.width / 2)
            $0.size.equalTo(wh)
            $0.top.equalTo(200)
        }
        
        bgScrollView.addSubview(topButton)
        topButton.snp.makeConstraints {
            $0.centerX.size.equalTo(centerButton)
            $0.bottom.equalTo(centerButton.snp.top).offset(-10)
        }

        
        bgScrollView.addSubview(bottomButton)
        bottomButton.snp.makeConstraints {
            $0.centerX.size.equalTo(centerButton)
            $0.top.equalTo(centerButton.snp.bottom).offset(10)
        }
        
        
        bgScrollView.addSubview(leftButton)
        leftButton.snp.makeConstraints {
            $0.centerY.size.equalTo(centerButton)
            $0.right.equalTo(centerButton.snp.left).offset(-10)
        }
        
        bgScrollView.addSubview(rightButton)
        rightButton.snp.makeConstraints {
            $0.centerY.size.equalTo(centerButton)
            $0.left.equalTo(centerButton.snp.right).offset(10)
        }
    }
    
    
    
    @objc func directionButtonEvent(sender: UIButton) {
            
        let text = bubble.text ?? ""
        switch sender.tag {
        case 0:
            bubble.show(text: text, direction: .up, from: sender)
            
        case 1:
            bubble.show(text: text, direction: .left, from: sender)
            
        case 2:
            bubble.show(text: text, direction: .down, from: sender)
            
        case 3:
            bubble.show(text: text, direction: .right, from: sender)
            
        case 4:
            bubble = BTBubble()
            update()
//            bubble.show(text: text, direction: .auto, from: sender)
            
        default:
            break
        }
    }
}



extension BubbleDirectionViewController {
    
    
    func baseSetting() {
        button.isHidden = true
        view.backgroundColor = UIColor.white
        title = "气泡的方向"
        
        view.addSubview(bgScrollView)
        bgScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

