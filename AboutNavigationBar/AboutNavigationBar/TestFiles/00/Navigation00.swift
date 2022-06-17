//
//  Navigation00.swift
//  AboutNavigationBar
//
//  Created by kkkelicheng on 2022/6/17.
//

import UIKit

class Navigation00: BaseNavigation {
    
    static func create() -> Navigation00 {
        let n = Navigation00.init(rootViewController: ViewController00A())
        return n
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
