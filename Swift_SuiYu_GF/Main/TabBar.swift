//
//  TabBar.swift
//  Swift_SuiYu_GF
//
//  Created by 黄成瑞 on 16/3/11.
//  Copyright © 2016年 hcr. All rights reserved.
//

import UIKit



// 2.写一个协议，协议中方法点击了某个按钮
protocol TabBarDelegate:NSObjectProtocol {
    /**
     点击了某个按钮的协议方法
    
    - parameter tabBar:tabBar
    - parameter index: 按钮index
    */
    func tabBar(tabbar:TabBar, didClickButton index: Int)
}




// 1.继承UITabBar 创建自定义 TabBar
class TabBar: UITabBar {
    
    // 1.1 声明一个弱引用的代理
    weak var aDelegate:TabBarDelegate?
    // 1.2 声明一个当前选中的button
    private var selButton:DHButton?
    
    // 1.3 重写awakeFromNib方法
    override func awakeFromNib() {
        
        // 1.3.1 调用负累的修改视图方法
        super.awakeFromNib()
        
        // 1.3.2 遍历图片数组，通过图片名字
        for i in 0..<btnImages.count {
            let imageName = btnImages[i]
            let b = buttonWithImageName(imageName)
            b.tag = i
            if i == 0 {
                buttonClick(b)
            }
            addSubview(b)
            buttons.append(b)
        }
    }
    
    // 1.4 私有方法：获取button根据图片和名称
    private func buttonWithImageName(imageName: String) -> DHButton {
        let b = DHButton(type: .Custom)
        let sImageName = imageName + "_sel"
        b.setImage(UIImage(named: imageName), forState: .Normal)
        b.setImage(UIImage(named: sImageName), forState: .Selected)
        b.addTarget(self, action: "buttonClick:", forControlEvents: .TouchDown)
        return b
    }
    
    // 1.5 重写layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 1.5.1 获取button个数，宽度，高度
        let count = buttons.count
        let w = CGRectGetWidth(bounds) / CGFloat(count)
        let h = CGRectGetHeight(bounds)
        
        let frame = CGRectMake(0, 0, w, h)
        
        // 1.5.2 重新修改button的frame中的x值
        for b in buttons {
            b.frame = CGRectOffset(frame, CGFloat(b.tag) * w, 0)
        }
    }
    
    // 1.6 
    func buttonClick(button: DHButton) {
        guard selButton != button else {
            return
        }
        
        if button.tag != 2 {
            selButton?.selected = false
            button.selected = true
            selButton = button
        }
        
        aDelegate?.tabBar(self, didClickButton: button.tag)
    }
    
    // 1.7 MARK: lazy loading 懒加载 TabBar图片数组
    private lazy var btnImages: [String] = {
        return ["tabbar_home", "tabbar_discover", "tabbar_show", "tabbar_message", "tabbar_profile"]
    }()
    
    // 1.8 MARK: lazy loading 懒加载 button数组
    private lazy var buttons: [UIButton] = {
        return [UIButton]()
    }()

}
















