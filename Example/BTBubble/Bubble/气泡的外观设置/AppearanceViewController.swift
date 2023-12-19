//
//  AppearanceViewController.swift
//  BTBubble_Example
//
//  Created by qixin on 2023/12/18.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import BTBubble
import SnapKit

class AppearanceViewController: UIViewController {
    
    var bubble = BTBubble()

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
        event()
    }
    
    @objc func event() {
        bubble.show(text: "明亮的月光洒在窗户纸上，好像地上泛起了一层白霜。我抬起头来，看那天窗外空中的明月，不由得低头沉思，想起远方的家乡。", from: button)
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
