//
//  SnViewController.swift
//  Vulcan-Contec
//
//  Created by Prabu on 24/12/20.
//  Copyright © 2020 Prabu. All rights reserved.
//

import UIKit

class SnViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var snDetail: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        snDetail.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = snDetail.dequeueReusableCell(withIdentifier: "cell")
        print(1)
        cell?.textLabel?.text = "1"
        cell?.detailTextLabel?.text = "2"
        
        return cell!
        
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
