//
//  BubbleViewController.swift
//  BTBubble_Example
//
//  Created by qixin on 2023/12/19.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import BTBubble

class BubbleBaseViewController: UIViewController {
    
    var bubble = BTBubble()
    
    var isAutoShowBubble: Bool = true
    
    var isCustomCutout: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = UIColor.white
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(300)
            make.size.equalTo(CGSize(width: 60, height: 40))
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isAutoShowBubble {
            event()
        }
    }
    
    @objc func event() {
        
        if isCustomCutout {
            customCutout()
        }

        bubble.show(text: "明亮的月光洒在窗户纸上，好像地上泛起了一层白霜。我抬起头来，看那天窗外空中的明月，不由得低头沉思，想起远方的家乡。", from: button, duration: nil)
    }
    
    lazy var button: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("点击", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor.red.withAlphaComponent(0.1)
        btn.addTarget(self, action: #selector(event), for: .touchUpInside)
        return btn
    }()
}



extension BubbleBaseViewController {
    func customCutout() {
        let from = button.convertFrameToScreen()
        let radio = max(from.width, from.height)
        bubble.cutoutBezierPath = UIBezierPath(roundedRect: from.insetBy(dx: -15, dy: -15), byRoundingCorners: .allCorners, cornerRadii: CGSize(width: radio, height: radio))
    }
}

extension BubbleBaseViewController {
    func updateFrom() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            
            // 需要拿到相对屏幕的frame
            var rect = self.button.convertFrameToScreen()
            rect.origin.y += 50
            
            self.bubble.from = rect
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                rect.origin.y += 50
                self.bubble.from = rect
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                    rect.origin.y += 50
                    self.bubble.from = rect
                    
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                        rect.origin.y += 50
                        self.bubble.from = rect
                    }
                }
            }
        }
    }
}
