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
            
            switch indexPath.row {
            case 0:
                tempVc.title = subModel.title
                tempVc.bubble.font = UIFont.systemFont(ofSize: 20)
                tempVc.bubble.textColor = UIColor.red
                tempVc.bubble.textAlignment = .center
                
            case 1:
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                    tempVc.bubble.update(text: "床前看月光，疑是地上霜。")
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                        tempVc.bubble.update(text: "抬头望山月，低头思故乡。")
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                            tempVc.bubble.hide()
                        }
                    }
                }
            default:
                break
            }
            

            
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
            
            
        case 5:
            
            let dirVc = BubbleDirectionViewController()
            dirVc.title = subModel.title
            
            switch indexPath.row {
            case 0:
                dirVc.isAutoShowBubble = false
               break
            case 1:
                dirVc.isAutoShowBubble = false
                dirVc.update()
                break
            default:
                break
            }
            return dirVc
            
            
        case 6:
            let dirVc = BubbleAnimateViewController()
            dirVc.title = "气泡的动画"
            return dirVc
            
        case 7:
            let ge = GestureViewController()
            ge.title = "气泡的手势"
            return ge
            
        case 8:
            let ge = GestureViewController()
            ge.title = "气泡的生命周期"
            return ge
            
        case 9:
            
            let style = BubbleShowStyleViewController()
            style.title = subModel.title
            
            switch indexPath.row {
            case 0:
                style.button.tag = 1000
        
            case 1:
                style.button.tag = 1001
                
            case 2:
                style.button.tag = 1002
                
            default:
                break
            }
            return style
            
            
        case 10:
            
         
            
            switch indexPath.row {
            case 0:
                let menu = BubbleMenuViewController()
                menu.title = subModel.title
                return menu
        
            case 1:
                let input = BubbleInputViewController()
                input.title = subModel.title
                return input
                
            default:
                break
            }
            
            
        default:
            break
        }
        
        return vc
    }
}
