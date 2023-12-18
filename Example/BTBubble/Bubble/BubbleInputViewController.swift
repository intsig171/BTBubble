//
//  BubbleInputViewController.swift
//  BTMaterial_Example
//
//  Created by qixin on 2023/4/17.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import BTBubble

class BubbleInputViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        title = "气泡"
        view.addSubview(textField)
        textField.inputView?.backgroundColor = UIColor.red
    }
    
    lazy var textField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.frame = CGRect(x: 50, y: 200, width: 270, height: 50)
        tf.backgroundColor = UIColor.orange
        tf.addTarget(self, action: #selector(textFieldDidEditing(textField:)), for: .editingChanged)
        tf.addTarget(self, action: #selector(textFieldDidBegin(textField:)), for: .editingDidBegin)

        return tf
    }()

    
    lazy var bubble: BTBubble = {
        let b = BTBubble()
        b.arrowSize = CGSize(width: 6, height: 7)
        b.arrowOffset = .before(8)
        b.horizontalOffset = -130
        return b
    }()
   
}

extension BubbleInputViewController {
    @objc func textFieldDidEditing(textField: UITextField) {
        
        let textWidth = textField.text?.getWidth(font: UIFont.systemFont(ofSize: 15), height: 20) ?? 0
        
        var f = textField.convertFrameToScreen()
        f.origin.x += textWidth
        bubble.from = f
    }
    @objc func textFieldDidBegin(textField: UITextField) {
//        textField.selectedTextRange?.end
        bubble.show(text: "122123123121", from: textField, duration: 100)
    }
}
