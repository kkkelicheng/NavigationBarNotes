//
//  ViewController00A.swift
//  AboutNavigationBar
//
//  Created by kkkelicheng on 2022/6/17.
//

import UIKit

class ViewController00A: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.about_setBgImageWithColor(.blue)
    }
    
    override func btnAction_pushNext() {
        super.btnAction_pushNext()
        self.navigationController?.pushViewController(ViewController00B.init(), animated: true)
    }
 
}
