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
class BubbleInputViewController: BubbleBaseViewController {
    
    /// 用于记录当前文字光标的位置
    private var currentPosition: Int = 0
    private var ignoreRecordMarkStart: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.isHidden = true
        isAutoShowBubble = false
                
        title = "气泡的联动"
        view.addSubview(textField)
        textField.inputView?.backgroundColor = UIColor.red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
    }
    
    lazy var textField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.frame = CGRect(x: 50, y: 200, width: 270, height: 50)
        tf.backgroundColor = UIColor.white
        tf.borderStyle = .roundedRect
        tf.addTarget(self, action: #selector(textFieldDidEditing(textField:)), for: .editingChanged)
        tf.addTarget(self, action: #selector(textFieldDidBegin(textField:)), for: .editingDidBegin)

        return tf
    }()

    
    
    lazy var bubbleView: BTBubble = {
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
        var x = f.origin.x + textWidth
        print("x == \(x)  || maxX = \(textField.frame.maxX)")
        
        if x > textField.frame.maxX - 8 {
            x = textField.frame.maxX - 8
        }
        
        f.origin.x = x
        
        
        bubbleView.from = f
        bubbleView.update(text: textField.text ?? "")
    }
    @objc func textFieldDidBegin(textField: UITextField) {
//        textField.selectedTextRange?.end
        bubbleView.show(text: "请输入", from: textField, duration: 100)
    }
}
