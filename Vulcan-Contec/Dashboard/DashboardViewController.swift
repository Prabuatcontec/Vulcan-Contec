//
//  DashboardViewController.swift
//  Vulcan-Contec
//
//  Created by Prabu on 20/12/20.
//  Copyright © 2020 Prabu. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    var userName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = strName

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var usernameLabel: UILabel!
    var strName = ""
    
    @IBAction func Logout(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DashboardViewController{
    static func shareInstance() -> DashboardViewController{
        return DashboardViewController.instantiateFromStoryboard("Dashboard")
    }
    
}
