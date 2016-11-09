//
//  TabBarController.swift
//  Swift_SuiYu_GF
//
//  Created by 黄成瑞 on 16/3/11.
//  Copyright © 2016年 hcr. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    // 1.将Main.storyboard中的TabBar拉线到这里，stroyboard也改成自己写的TabBar类
    @IBOutlet weak var aTabBar: TabBar!
    
    // 2.viewDidLoad中 给storyboard中的TabBar代理设置为本控制器
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aTabBar.aDelegate = self
    }
    
    // 3.重写视图将要显示(移除系统tabbar子views)
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        removeSystemTabbarSubviews()
    }
    
    // 4.重写视图已经布局子views(移除系统tabbar子views)
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        removeSystemTabbarSubviews()
    }
    
    // 5.私有方法：移除系统tabbar子视图
    private func removeSystemTabbarSubviews() {
        for v in tabBar.subviews {
            if v.superclass == UIControl.self {
                v.removeFromSuperview()
            }
        }
    }
}


// 6.延展：tabBar方法，需要参数tabbar,index  实现协议方法
extension TabBarController: TabBarDelegate {
    
    func tabBar(tabBar: TabBar, var didClickButton index: Int) {
        if index == 2 {
            let showVC = UIStoryboard.initialViewController("Show")
            presentViewController(showVC, animated: true, completion: nil)
            return
        }else if index >= 2 {
            index -= 1
        }
        selectedIndex = index  // 用于控制storyboard 选中后更改控制器
    }
}
