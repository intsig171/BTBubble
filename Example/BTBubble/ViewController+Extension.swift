//
//  ViewController+Extension.swift
//  BTBubble_Example
//
//  Created by qixin on 2023/12/18.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import UIKit


extension ViewController {
    
    func casePresentation(indexPath: IndexPath) -> UIViewController? {
        let model = dataArray[indexPath.section]
        let subModel = model.items[indexPath.row]
        guard let vc = createViewControllerObject(form: subModel.vc) else { return nil }
            
        guard let tempVc = vc as? BubbleBaseViewController else { return nil }

        switch indexPath.section {
        case 0:
            
            
            tempVc.title = subModel.title
            
            switch indexPath.row {
            case 0:
                tempVc.bubble.fillColor = UIColor.red.withAlphaComponent(0.2)
            case 1:
                tempVc.bubble.cornerRadius = 8
            case 2:
                tempVc.bubble.borderColor = UIColor.clear
                tempVc.bubble.borderWidth = 0.0
            case 3:
                tempVc.bubble.shadowColor = UIColor.red
                tempVc.bubble.shadowOffset = .zero
                tempVc.bubble.shadowRadius = 4
                tempVc.bubble.shadowOpacity = 0.2

            case 4:
                tempVc.bubble.edgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
            default:
                break
            }
            return tempVc
            
            
        case 1:
            
            
            tempVc.title = subModel.title
            tempVc.bubble.font = UIFont.systemFont(ofSize: 20)
            tempVc.bubble.textColor = UIColor.red
            tempVc.bubble.textAlignment = .center
            
            return tempVc
            
            
        case 2:
            
            tempVc.title = subModel.title
            
            switch indexPath.row {
            case 0:
                tempVc.bubble.arrowSize = CGSize(width: 20, height: 20)
            case 1:
                tempVc.bubble.arrowSize = CGSize(width: 20, height: 20)
                tempVc.bubble.arrowRadius = 10
            case 2:
                tempVc.bubble.arrowOffset = .auto(0)
                
            case 3:
                tempVc.bubble.verticalOffset = 50

            case 4:
                tempVc.bubble.horizontalOffset = -50
            default:
                break
            }
            return tempVc
            
            
        case 3:
            
            tempVc.title = subModel.title
            
            switch indexPath.row {
            case 0:
                tempVc.bubble.distanceFromBoundary = 100
            case 1:
                tempVc.bubble.verticalOffset = 50
            case 2:
                tempVc.bubble.horizontalOffset = -100
            case 3:
                tempVc.updateFrom()
            case 4:
                tempVc.bubble.horizontalOffset = -50
            default:
                break
            }
            return tempVc
            
            
        case 4:
            
            tempVc.title = subModel.title
            
            switch indexPath.row {
            case 0:
                tempVc.bubble.maskColor = UIColor.blue.withAlphaComponent(0.2)
                tempVc.bubble.shouldShowMask = true
            case 1:
                tempVc.bubble.maskColor = UIColor.blue.withAlphaComponent(0.2)
                tempVc.bubble.shouldShowMask = true
                tempVc.bubble.shouldCutoutMask = true
            case 2:
                tempVc.bubble.maskColor = UIColor.blue.withAlphaComponent(0.2)
                tempVc.bubble.shouldShowMask = true
                tempVc.bubble.shouldCutoutMask = true
                tempVc.isCustomCutout = true
                
                
                
            default:
                break
            }
            return tempVc
            
        default:
            break
        }
        
        return vc
    }
}
