//
//  ViewController.swift
//  AboutNavigationBar
//
//  Created by kkkelicheng on 2022/6/17.
//

import UIKit

class ViewController: UIViewController {

    var dataSource : [String] = [
        "00/不同颜色的导航栏渐变",
    ]
    
    lazy var tableView : UITableView = {
        let t = UITableView.init(frame: .zero, style: .plain)
        t.delegate = self
        t.dataSource = self
        return t
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}


extension ViewController:   UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "mycell")
        }
        cell?.textLabel?.text = dataSource[indexPath.item]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0:
            let vc = Navigation00.create()
            self.present(vc, animated: true, completion: nil)
        default:
            break
        }
    }
  
}
