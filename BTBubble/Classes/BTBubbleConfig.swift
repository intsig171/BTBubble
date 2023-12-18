//
//  BTBubbleConstant.swift
//  BTMaterial
//
//  Created by Mccc on 2022/11/21.
//

import Foundation



public struct BTBubbleConfig {
    public static var shared = BTBubbleConfig()
    
    
    /// 气泡的最大宽度
    public var maxWidth: CGFloat = 282
    /// 气泡文案最大高度（不影响自定义）
    public var maxHeight: CGFloat = UIScreen.main.bounds.size.height * 0.35
    
    /// 默认的反弹距离
    public var defaultBounceOffset = CGFloat(8)
    /// 默认的浮动距离
    public var defaultFloatOffset = CGFloat(8)
    /// 默认的跳动缩放比例
    public var defaultPulseOffset = CGFloat(1.1)
    

}







