//
//  BubbleShowStyleViewController.swift
//  BTBubble_Example
//
//  Created by qixin on 2023/12/19.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class BubbleShowStyleViewController: BubbleBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        isAutoShowBubble = false
        
        button.addTarget(self, action: #selector(showStyleEvent), for: .touchUpInside)

        
    }
    

    @objc func showStyleEvent() {
        
        switch button.tag {
        case 1000:

            let text = "明亮的月光洒在窗户纸上，好像地上泛起了一层白霜。我抬起头来，看那天窗外空中的明月，不由得低头沉思，想起远方的家乡。"
            bubble.show(text: text, direction: .auto, maxWidth: 200, from: button)
        case 1001:
            let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.darkGray]
            let underline: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.systemBlue, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
            let attributedText = NSMutableAttributedString(string: "该动态产在", attributes: attributes)
            attributedText.append(NSAttributedString(string: "XXXX有限公司", attributes: underline))
            attributedText.append(NSAttributedString(string: "， 请及时关注，避免风险。", attributes: attributes))
            bubble.show(attributedText: attributedText, direction: .up, maxWidth: 200, from: button)
        case 1002:
            let customView = UIView()
            customView.backgroundColor = UIColor.orange
            customView.frame.size = CGSize(width: 200, height: 100)
            
            let titleLabel = UILabel()
            titleLabel.text = "这是一个自定义的View"
            titleLabel.frame = CGRect(x: 10, y: 10, width: 180, height: 40)
            
            

            
            customView.addSubview(titleLabel)
            
            bubble.show(customView: customView, direction: .auto, from: button, duration: 10)

        default:
            break
        }
        
    }

}
