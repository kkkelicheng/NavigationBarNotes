//
//  NavigationBar+Extension.swift
//  FyairTickerManagement
//
//  Created by kkkelicheng on 2021/11/10.
//  Copyright © 2021 fyaircompany. All rights reserved.
//

import UIKit

//...为了适配iOS15
extension UINavigationBar {
    
    @objc func about_setNavBarAppearance(_ appearance:UINavigationBarAppearance){
        standardAppearance = appearance
        scrollEdgeAppearance = appearance
        if #available(iOS 15.0, *) { //其实这里是适配iOS15
            compactScrollEdgeAppearance = appearance
        }
    }
    
    @objc func about_setBgImageWithColor(_ bgColor: UIColor){
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundEffect = nil
            appearance.backgroundColor = bgColor
            appearance.shadowColor = .clear
            appearance.shadowImage = UIImage()
            about_setNavBarAppearance(appearance)
        }
        
        shadowImage = UIImage()
        tintColor = .white;
        isTranslucent = true;
    }
    
    @objc func about_setBarClear(){
        setBackgroundImage(UIImage(), for: .default);
        backgroundColor = .clear
        shadowImage = UIImage()
        tintColor = .clear;
        isTranslucent = true;
        if #available(iOS 11.0, *) {
            let firstView = self.subviews.first;
            if let _barBackgroundView = firstView {
                for view in _barBackgroundView.subviews {
                    if let imageView = view as? UIImageView {
                        imageView.image = UIImage();
                    }
                }
            }
        } else {
            // Fallback on earlier versions
        };
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundEffect = nil
            appearance.shadowImage = UIImage()
            appearance.backgroundColor = UIColor.clear
            about_setNavBarAppearance(appearance)
            return
        }
       
    }
    
    //设置title颜色
    @objc func about_configTitleStyle(color:UIColor) {
        if #available(iOS 13.0, *) {
            let appearance_standard = self.standardAppearance
            appearance_standard.titleTextAttributes = [NSAttributedString.Key.foregroundColor:color]
            scrollEdgeAppearance = appearance_standard
            standardAppearance = appearance_standard
            return
        }
        titleTextAttributes = [NSAttributedString.Key.foregroundColor:color]
    }
    
}
