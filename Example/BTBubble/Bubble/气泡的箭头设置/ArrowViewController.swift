//
//  ArrowViewController.swift
//  BTBubble_Example
//
//  Created by qixin on 2023/12/19.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import BTBubble

class ArrowViewController: UIViewController {
    
    var bubble = BTBubble()

    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = UIColor.white
        
        view.addSubview(button)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(300)
            make.size.equalTo(CGSize(width: 60, height: 40))
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        event()
    }
    
    @objc func event() {
        bubble.show(text: "明亮的月光洒在窗户纸上，\n好像地上泛起了一层白霜.", direction: .autoVertical, from: button)
    }
    
    private lazy var button: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("点击", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor.red.withAlphaComponent(0.1)
        btn.addTarget(self, action: #selector(event), for: .touchUpInside)
        return btn
    }()
}
