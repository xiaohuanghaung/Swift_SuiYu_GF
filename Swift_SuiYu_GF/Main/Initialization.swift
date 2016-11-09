//
//  Initialization.swift
//  Swift_SuiYu_GF
//
//  Created by 黄成瑞 on 16/3/11.
//  Copyright © 2016年 hcr. All rights reserved.
//

import UIKit

class Initialization: NSObject {
    
    // 1.初始化外观
    class func initializationAppearance(window: UIWindow?) {
        window?.backgroundColor = UIColor.whiteColor()
        
        let navBar = UINavigationBar.appearance()
        let navBarSize = CGSizeMake(UIScreen.mainScreen().bounds.width, 188)
        let navBarImage = UIImage.imageWithColor(kAppearanceColor, size: navBarSize)
        navBar.setBackgroundImage(navBarImage, forBarMetrics: .Default)
        navBar.shadowImage = UIImage()
        navBar.tintColor = UIColor.whiteColor()
        
        navBar.titleTextAttributes = [NSFontAttributeName: kNavigationBarFont, NSForegroundColorAttributeName: UIColor.whiteColor()
        ]
        
        // 控制是否tabBar透明
        let tabBar = UITabBar.appearance()
        tabBar.translucent = false
        
    
    }
    
}
