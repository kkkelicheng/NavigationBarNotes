//
//  BaseViewController.swift
//  AboutNavigationBar
//
//  Created by kkkelicheng on 2022/6/17.
//

import UIKit

class BaseViewController: UIViewController {
    
    var nextBtn : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置title内容
        let className = String.init(describing: type(of: self))
        let title = String(className.suffix(3))
        self.title = title
        //设置背景色
        view.backgroundColor = .white
        
        //
        nextBtn = UIButton.init(frame: .zero)
        view.addSubview(nextBtn)
        nextBtn.setTitle("push next", for: .normal)
        nextBtn.backgroundColor = .red
        nextBtn.setTitleColor(.white, for: .normal)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false;
        nextBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nextBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nextBtn.addTarget(self, action: #selector(btnAction_pushNext), for: .touchUpInside)
    }
    
    @objc func btnAction_pushNext(){
        
    }
}
