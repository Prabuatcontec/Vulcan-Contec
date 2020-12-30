//
//  HomeViewController.swift
//  Vulcan-Contec
//
//  Created by Prabu on 21/12/20.
//  Copyright © 2020 Prabu. All rights reserved.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController, MenuListCotrollerDelegate {
    
    private var sideMenu: SideMenuNavigationController?
    private let scanController = ScanViewController()
    var _username: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = MenuListController(with:["Home", "Info", "SN Detail"])
        sideMenu = SideMenuNavigationController(rootViewController: menu )
        menu.delegate = self
        title = "Home"
        username.text = _username
        sideMenu?.leftSide = true
        
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        addChildController()
        // Do any additional setup after loading the view.
    }
    @IBAction func didTapMenu()
    {
        present(sideMenu!, animated: true)
    }
    
    private func addChildController() {
        addChild(scanController)
        view.addSubview(scanController.view)
        scanController.view.frame = view.bounds
        scanController.didMove(toParent: self)
        scanController.view.isHidden = true
    }
    
    func didSelectMenuItem(named: String) {
        sideMenu?.dismiss(animated: true, completion: { [weak self] in
            
            self?.title = named
            
            if named == "Home"{
                self?.view.backgroundColor = .blue
                self?.scanController.view.isHidden = true
            } else if named == "Info" {
                self?.view.backgroundColor = .red
                self?.scanController.view.isHidden = true
            } else if named == "SN Detail" {
                self?.view.backgroundColor = .green
                self?.scanController.view.isHidden = false
            }
        })
    }

    @IBOutlet weak var username: UILabel!
    
   

}

protocol MenuListCotrollerDelegate {
    func didSelectMenuItem(named: String)
}

class MenuListController: UITableViewController {
    private let  lists : [String]
    
    public var delegate: MenuListCotrollerDelegate?
    init(with lists:[String]) {
        self.lists = lists
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
        view.backgroundColor = UIColor(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexpath)
        cell.textLabel?.text = lists[indexpath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = UIColor(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
        cell.contentView.backgroundColor = UIColor(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = lists[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
        
    }
}
