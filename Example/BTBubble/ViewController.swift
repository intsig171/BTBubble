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
    var dataArray: [Model] = [
        Model(title: "气泡的外观设置",
              items: [
                SubModel(title: "气泡的背景颜色", vc: "BubbleBaseViewController"),
                SubModel(title: "气泡的圆角", vc: "BubbleBaseViewController"),
                SubModel(title: "气泡的边框", vc: "BubbleBaseViewController"),
                SubModel(title: "气泡的阴影", vc: "BubbleBaseViewController"),
                SubModel(title: "气泡的内边距", vc: "BubbleBaseViewController"),
              ]
             ),
        
        
        Model(title: "气泡的文字",
              items: [
                SubModel(title: "文字的设置", vc: "BubbleBaseViewController")
              ]
             ),
        
        
        Model(title: "气泡的箭头",
              items: [
                SubModel(title: "箭头的大小", vc: "BubbleBaseViewController"),
                SubModel(title: "箭头的圆角", vc: "BubbleBaseViewController"),
                SubModel(title: "箭头的偏移量", vc: "BubbleBaseViewController"),
              ]
             ),
        

        Model(title: "气泡的位置",
              items: [
                SubModel(title: "气泡距离屏幕最小间距", vc: "BubbleBaseViewController"),
                SubModel(title: "气泡相对于目标控件的中心的偏移量", vc: "BubbleBaseViewController"),
                SubModel(title: "气泡(整体)相对于目标控件的中心的偏移量", vc: "BubbleBaseViewController"),
                SubModel(title: "气泡的目标区域设置", vc: "BubbleBaseViewController"),
              ]
             ),
        
        
        Model(title: "气泡的遮罩层",
              items: [
                SubModel(title: "遮罩层的颜色", vc: "BubbleBaseViewController"),
                SubModel(title: "遮罩层的挖孔", vc: "BubbleBaseViewController"),
                SubModel(title: "遮罩层的自定义挖孔", vc: "BubbleBaseViewController"),
              ]
             ),
    ]
    
    
    lazy var tableView: UITableView = {
        let tb = UITableView.init(frame: .zero, style: .grouped)
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tb.delegate = self
        tb.dataSource = self
        tb.frame = view.frame
        return tb
    }()
    
    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = dataArray[section]
        return model.items.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.backgroundColor = UIColor.red.withAlphaComponent(0.1)
        label.text = "   " + dataArray[section].title
        return label
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let model = dataArray[indexPath.section]
        cell.textLabel?.text = model.items[indexPath.row].title
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = casePresentation(indexPath: indexPath) {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}


extension ViewController {
    
    func createViewControllerObject(form className: String) -> UIViewController? {
        let projectName = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        let classStringName = projectName + "." + className
        if let viewControllerClass = NSClassFromString(classStringName) as? UIViewController.Type {
            let viewController = viewControllerClass.init()
            return viewController
        } else {
            return nil
        }
    }
}
