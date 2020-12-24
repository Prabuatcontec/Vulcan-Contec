//
//  HomeViewController.swift
//  Vulcan-Contec
//
//  Created by Prabu on 21/12/20.
//  Copyright © 2020 Prabu. All rights reserved.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController {
var _username: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        username.text = _username
        SideMenuNavigationController(rootViewController: MenuListController()).leftSide = true
        
        SideMenuManager.default.leftMenuNavigationController = SideMenuNavigationController(rootViewController: MenuListController())
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        // Do any additional setup after loading the view.
    }
    @IBAction func didTapMenu()
    {
        present(SideMenuNavigationController(rootViewController: MenuListController()), animated: true)
    }

    @IBOutlet weak var username: UILabel!
    
    class MenuListController: UITableViewController {
        var lists = ["First", "Second", "Third"]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return lists.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexpath)
            cell.textLabel?.text = lists[indexpath.row]
            return cell
        }
    }

}
