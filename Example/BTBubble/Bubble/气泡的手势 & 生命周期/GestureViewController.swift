//
//  GestureViewController.swift
//  BTBubble_Example
//
//  Created by qixin on 2023/12/18.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import BTBubble
import SnapKit

class GestureViewController: BubbleBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        isAutoShowBubble = false
        
        bubble.shouldDismissOnTap = true
        bubble.shouldDismissOnTapOutside = true
        bubble.shouldDismissOnScrollOutside = true
        

        
        
        bubble.tapHandler = { _ in
            print("点击气泡区域")
        }
        
        bubble.tapOutsideHandler = { _ in
            print("点击了气泡之外的区域")
        }
        
        bubble.tapTargetHandler = { _ in
            print("点击了目标区域")
        }
        
        bubble.scrollOutsideHandler = { _ in
            print("气泡外滑动")
        }
        
        bubble.appearHandler = { _ in
            print("气泡出现")
        }

        bubble.dismissHandler = { _ in
            print("气泡消失")
        }
    }
}
