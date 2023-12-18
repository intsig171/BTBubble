//
//  BubbleViewController.swift
//  BTMaterial_Example
//
//  Created by qixin on 2022/11/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import BTBubble

class Bubble1DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        baseSetting()
        loadDirectionUI()
        
        loadDetailUI()
    }
    

    var bubble: BTBubble?
    
    
    lazy var bgScrollView: UIScrollView = {
        let sc = UIScrollView()
        sc.contentSize = CGSize(width: UIDevice.width, height: UIDevice.height * 1.5)
        sc.showsVerticalScrollIndicator = true
        
        return sc
    }()
    
    
    lazy var topButton: UIButton = createDirectionButton(tag: 0, text: "上")
    lazy var leftButton: UIButton = createDirectionButton(tag: 1, text: "左")
    lazy var centerButton: UIButton = createDirectionButton(tag: 2, text: "中")
    lazy var rightButton: UIButton = createDirectionButton(tag: 3, text: "右")
    lazy var bottomButton: UIButton = createDirectionButton(tag: 4, text: "下")
}




extension Bubble1DetailViewController {
    
    func createDirectionButton(tag: Int, text: String) -> UIButton {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = UIColor.orange
        btn.layer.cornerRadius = 30
        btn.layer.masksToBounds = true
        btn.setTitle(text, for: .normal)
        btn.tag = tag
        btn.addTarget(self, action: #selector(directionButtonEvent), for: .touchUpInside)
        
        return btn
    }
    
    
    func loadDirectionUI() {
        let wh = CGSize(width: 60, height: 60)
                        
        bgScrollView.addSubview(centerButton)
        centerButton.snp.makeConstraints {
            $0.centerX.equalTo(UIDevice.width / 2)
            $0.size.equalTo(wh)
            $0.top.equalTo(200)
        }
        
        bgScrollView.addSubview(topButton)
        topButton.snp.makeConstraints {
            $0.centerX.size.equalTo(centerButton)
            $0.bottom.equalTo(centerButton.snp.top).offset(-10)
        }

        
        bgScrollView.addSubview(bottomButton)
        bottomButton.snp.makeConstraints {
            $0.centerX.size.equalTo(centerButton)
            $0.top.equalTo(centerButton.snp.bottom).offset(10)
        }
        
        
        bgScrollView.addSubview(leftButton)
        leftButton.snp.makeConstraints {
            $0.centerY.size.equalTo(centerButton)
            $0.right.equalTo(centerButton.snp.left).offset(-10)
        }
        
        bgScrollView.addSubview(rightButton)
        rightButton.snp.makeConstraints {
            $0.centerY.size.equalTo(centerButton)
            $0.left.equalTo(centerButton.snp.right).offset(10)
        }
    }
    
    
    
    @objc func directionButtonEvent(sender: UIButton) {
        
        bubble = BTBubble()
        
        
        switch sender.tag {
        case 0:
            bubble?.show(text: "这是一个方向向上的气泡1\n这是一个方向向上的气泡2\n这是一个方向向上的气泡3\n这是一个方向向上的气泡4\n这是一个方向向上的气泡5\n这是一个方向向上的气泡6\n这是一个方向向上的气泡7\n这是一个方向向上的气泡8\n这是一个方向向上的气泡9\n这是一个方向向上的气泡10\n这是一个方向向上的气泡11\n这是一个方向向上的气泡12\n这是一个方向向上的气泡14这是一个方向向上的气泡15", direction: .autoVertical, maxWidth: 100, from: sender)
        case 1:
            bubble?.show(text: "这是一个方向向左的气泡", direction: .left, maxWidth: 200, from: sender)
        case 2:
            bubble?.show(text: "这是一个自动更换的气泡", direction: .up, maxWidth: 200, from: sender)
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.bubble?.show(text: "这是一个自动更换的气泡", direction: .right, maxWidth: 200, from: sender)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    self.bubble?.show(text: "这是一个自动更换的气泡", direction: .down, maxWidth: 200, from: sender)
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                        self.bubble?.show(text: "这是一个自动更换的气泡", direction: .left, maxWidth: 200, from: sender)
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                            self.bubble?.hide()
                        }
                    }
                }
            }
            
        case 3:
            
            bubble?.show(text: "这是一个方向向右的气泡", direction: .right, maxWidth: 200, from: sender)
        case 4:
            bubble?.show(text: "这是一个方向向下的气泡", direction: .down, maxWidth: 200, from: sender)
            
        default:
            break
        }
    }
}


extension Bubble1DetailViewController {

    @objc func detailButtonEvent(sender: UIButton) {
        
        bubble = BTBubble()
        let tag = sender.tag - 1000
        
        switch tag {
        case 0:
            bubble?.shouldShowMask = true
            bubble?.shouldCutoutMask = true
            
            let from = sender.convertFrameToScreen()
            bubble?.cutoutBezierPath = UIBezierPath(roundedRect: from.insetBy(dx: -8, dy: -8), byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 40, height: 40))
            
            bubble?.show(text: "带遮罩层的气泡", direction: .left, maxWidth: 200, from: sender)
        case 1:
            
            bubble?.shouldShowMask = true
            bubble?.shouldCutoutMask = true
            bubble?.verticalOffset = 8

            bubble?.show(text: "带遮罩层的气泡", direction: .up, maxWidth: 200, from: sender)

            
        case 2:
            bubble?.show(text: "静夜思 - 李白", direction: .right, maxWidth: 200, from: sender)
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.bubble?.update(text: "床前看月光，疑是地上霜。")
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    self.bubble?.update(text: "抬头望山月，低头思故乡。")
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                        self.bubble?.hide()
                    }
                }
            }
            
        case 3:
            bubble?.actionAnimation = .bounce(1.3)
            bubble?.show(text: "将进酒 - 李白", direction: .up, maxWidth: 200, from: sender)
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                self.bubble?.show(text: "人生得意须尽欢", direction: .down, maxWidth: 200, from: self.bottomButton)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                    self.bubble?.show(text: "莫使金樽空对月", direction: .left, maxWidth: 200, from: self.leftButton)
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                        self.bubble?.show(text: "天生我材必有用", direction: .up, maxWidth: 200, from: self.topButton)
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                            self.bubble?.show(text: "千金散尽还复来", direction: .right, maxWidth: 200, from: self.rightButton)
                        }
                    }
                }
            }

        case 4:
            let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.black]
            let underline: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.blue, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
            let attributedText = NSMutableAttributedString(string: "该动态产在", attributes: attributes)
            attributedText.append(NSAttributedString(string: "XXXX有限公司", attributes: underline))
            attributedText.append(NSAttributedString(string: "， 请及时关注，避免风险。", attributes: attributes))
            bubble?.show(attributedText: attributedText, direction: .up, maxWidth: 200, from: sender)
            
        case 5:
            let customView = UIView()
            customView.backgroundColor = UIColor.orange
            customView.frame.size = CGSize(width: 200, height: 100)
            
            let titleLabel = UILabel()
            titleLabel.text = "这是一个自定义的View"
            titleLabel.frame = CGRect(x: 10, y: 10, width: 180, height: 40)
            
            
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(event))
            customView.addGestureRecognizer(tap)
            
            
            
            customView.addSubview(titleLabel)
            
            bubble?.shouldShowMask = true
            bubble?.entranceAnimation = .custom
            bubble?.exitAnimation = .custom
            bubble?.entranceAnimationHandler = {  [weak self] completion in
                self?.bubble?.transform = CGAffineTransform(rotationAngle: 1)
                UIView.animate(withDuration: 0.5, animations: {
                    self?.bubble?.transform = .identity
                }, completion: { (_) in
                    

                    
                    /// 一定要有回调
                    completion()
                })
            }
            
            bubble?.exitAnimationHandler = { [weak self] completion in
                
                
                let ani: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.rotation")
                ani.values = [-Double.pi/180*4,Double.pi/180*4,-Double.pi/180*4]
                ani.repeatCount = 10
                self?.bubble?.layer.add(ani, forKey: "shakeAnimation")
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    self?.bubble?.entranceAnimation = .scale
                    self?.bubble?.exitAnimation = .scale
                    /// 一定要有回调
                    completion()
                }
            }
            
            
            bubble?.show(customView: customView, direction: .auto, from: sender, duration: 10)

        case 6:
            let menuBubble = BTBubble.makeMenuBubble()
            
            
            let item1 = BTBubble.Menu.Item(text: "查看监控动态", identifier: "", image: UIImage(named: "tabbar_01"))
            let item2 = BTBubble.Menu.Item(text: "查看监控列表", identifier: "", image: nil)
            let item3 = BTBubble.Menu.Item(text: "取消监控", identifier: "", image: nil)
            
            
            var config = BTBubble.Menu.Config()
            config.width = .auto(200)
            let menuView = BTBubbleMenu(items: [item1, item2, item3], config: config)
            menuView.selectItemBlock = { item in
                print(item)
            }
            
            menuBubble.show(customView: menuView, direction: .auto, from: sender, duration: nil)
        default:
            break
        }
    }
    
    
    
    func createDetailButton(tag: Int, text: String) -> UIButton {
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = UIColor.orange
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = true
        btn.setTitle(text, for: .normal)
        btn.tag = tag + 1000
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.addTarget(self, action: #selector(detailButtonEvent(sender:)), for: .touchUpInside)
        
        return btn
    }
    
    func loadDetailUI() {
        
        
        let dataArray = [
        "带遮罩层的气泡",
        "带全屏的遮罩层的气泡",
        "更换展示内容",
        "更换目标主体",
        "富文本",
        "自定义",
        "菜单气泡"
        ]
        
        
        let margin: CGFloat = 20
        let lineCount = 3
        let width: CGFloat = (UIDevice.width - margin * CGFloat(lineCount + 1)) / CGFloat(lineCount)
        let size = CGSize(width: width, height: 40)
        
        
        for (index, item) in dataArray.enumerated() {
            
            let row: CGFloat = CGFloat(index % lineCount)
            let line: CGFloat = CGFloat(index / lineCount)
            
            let btn = createDetailButton(tag: index, text: item)
            bgScrollView.addSubview(btn)
            btn.snp.makeConstraints {
                $0.size.equalTo(size)
                $0.left.equalTo(margin + row*(size.width + margin))
                $0.top.equalTo(bottomButton.snp.bottom).offset(100 + line * (20 + size.height))
            }
        }
        
        
        
        
    }
    
}


extension Bubble1DetailViewController {
    
    @objc func event() {
        print("223123131")
    }
    
    func baseSetting() {
        view.backgroundColor = UIColor.white
        title = "气泡"
        
        view.addSubview(bgScrollView)
        bgScrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

