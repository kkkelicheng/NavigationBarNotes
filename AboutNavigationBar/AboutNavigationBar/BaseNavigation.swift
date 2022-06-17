//
//  BaseNavigation.swift
//  AboutNavigationBar
//
//  Created by kkkelicheng on 2022/6/17.
//

import UIKit


class BaseNavigation : UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true;
        }
        super.pushViewController(viewController, animated: animated);
    }
    
    ///hook pop方法
    override func popViewController(animated: Bool) -> UIViewController? {
        return super.popViewController(animated: animated)
    }
    
    
    //添加一个返回方法
    @objc func goBack(){
        if self.viewControllers.count > 1 {
            _ = self.popViewController(animated: true);
        }
        else if self.presentingViewController != nil{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    /// 适配iOS13的present
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        if #available(iOS 13.0, *) {
            if viewControllerToPresent.modalPresentationStyle == .automatic || viewControllerToPresent.modalPresentationStyle == .none {
                viewControllerToPresent.modalPresentationStyle = .fullScreen
            }
        } else {
            // Fallback on earlier versions
        }
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}


//MARK:rotate
extension BaseNavigation {
    override var shouldAutorotate: Bool {
        return self.topViewController?.shouldAutorotate ?? false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.topViewController?.supportedInterfaceOrientations ?? .all
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return self.topViewController?.preferredInterfaceOrientationForPresentation ?? .portrait
    }
}

//MARK:statusBar
extension BaseNavigation {
    override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    
    override var childForStatusBarHidden: UIViewController? {
        return self.topViewController
    }
}


//MARK:indicator
extension BaseNavigation {
    override var childForHomeIndicatorAutoHidden: UIViewController? {
        return self.topViewController
    }
}

