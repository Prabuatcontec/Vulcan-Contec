//
//  SnTableViewController.swift
//  Vulcan-Contec
//
//  Created by Prabu on 28/12/20.
//  Copyright © 2020 Prabu. All rights reserved.
//

import UIKit

class SnTableViewController: UITableViewController {
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var serialArray = [SnModel]()
    override func viewDidLoad() {
        print("in")
        super.viewDidLoad()
        self.getSnDetail()
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let nib = UINib(nibName: "CellTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CellTableViewCell")
        self.spinner.hidesWhenStopped = true
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    @IBAction func getSnDetail() {
        spinner.startAnimating()
        APIManager.shareInstance.callSnDetailAPI() {
            (result) in
            switch result{
            case .success(let json):
                if let sn = (json as AnyObject) as? [String: AnyObject]{
                   
                    let snVal = (sn as AnyObject).value(forKey: "serialNumber") as! String
                    let modelVal = (sn as AnyObject).value(forKey: "vulcanModelName") as! String
                    let ordrIDVal = (sn as AnyObject).value(forKey: "orderID") as! Int
                    let familyVal = (sn as AnyObject).value(forKey: "oemFamily") as! String
                    let cosStdVal = (sn as AnyObject).value(forKey: "cosmeticsStandard") as! String
                    let snArr = SnModel(name: "SN", value: snVal)
                    self.serialArray.append(snArr)
                    let modelArr = SnModel(name: "Model", value: modelVal)
                    let ordArr = SnModel(name: "Order", value: String(ordrIDVal))
                    let familyArr = SnModel(name: "Family", value: familyVal)
                    let costStd = SnModel(name: "Cosmetics", value: cosStdVal)
                    self.serialArray.append(modelArr)
                    self.serialArray.append(ordArr)
                    self.serialArray.append(familyArr)
                    self.serialArray.append(costStd)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData();
                    }
                    //let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    //                    guard let mainNavigationVC = mainStoryboard.instantiateViewController(withIdentifier: "SnTableViewController") as?
                    //                        SnTableViewController else{
                    //                            print(1111)
                    //                            return
                    //                    }
                    
                    //                    if let mainVC = mainNavigationVC.topViewController as? HomeViewController {
                    //                        mainVC._username = userModel.userName
                    //                    }
                    //self.present(mainNavigationVC, animated: true, completion: nil)
                }
            case .failure(let err):
                print(err.localizedDescription)
                let alert = UIAlertController(title: "", message: "Invalid Password", preferredStyle: .alert)
                self.present(alert, animated: true) {
                    sleep(3)
                    alert.dismiss(animated: true) }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return serialArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTableViewCell", for: indexPath) as! CellTableViewCell
        let serials = serialArray[indexPath.row]
        
        cell.title.text = serials.name
        cell.value.text = serials.value
        print(indexPath.row)
        print(serialArray.count)
        if indexPath.row > 1 {
            spinner.stopAnimating()
        }
        return cell
    }
    
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
