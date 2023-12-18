//
//  ViewController.swift
//  BTBubble
//
//  Created by mancong@bertadata.com on 12/18/2023.
//  Copyright (c) 2023 mancong@bertadata.com. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        title = "气泡"
        view.addSubview(tableView)
    }
    
    // 添加一个跟随光标滚动的模式
    var dataArray: [String] = [
        "气泡的外观设置", "气泡的文字设置", "气泡的遮罩层","气泡的箭头", "气泡展示和隐藏的淡入淡出动画", "气泡展示和隐藏的缩放动画", "气泡展示中的动画", "气泡展示和隐藏的自定义动画", "气泡的箭头位置", "跟随输入光标更换位置", "气泡的更多使用"
    ]
        
    
    lazy var tableView: UITableView = {
        let tb = UITableView.init(frame: .zero, style: .plain)
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tb.delegate = self
        tb.dataSource = self
        tb.frame = view.frame
        return tb
    }()

    
   
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == dataArray.count - 1 {
            let vc = Bubble1DetailViewController()
            navigationController?.pushViewController(vc, animated: true)
            return
        }
        if indexPath.row == dataArray.count - 2 {
            let vc = BubbleInputViewController()
            navigationController?.pushViewController(vc, animated: true)
            return
        }
        
        
        
        let vc = Bubble0DetailViewController()
        vc.showButton.tag = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}


