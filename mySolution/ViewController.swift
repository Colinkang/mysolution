//
//  ViewController.swift
//  mySolution
//
//  Created by clare on 2017/5/25.
//  Copyright © 2017年 bitse. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier","Bourke Street Bakery", "Haigh’s Chocolate", "Palomino Espresso","Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle &Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina","Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return restaurantNames.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cellIdentifier = "Cell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for:
                indexPath) as UITableViewCell
            // Configure the cell...
            cell.textLabel?.text = restaurantNames[indexPath.row]
            cell.imageView?.image = UIImage(named: "images.jpeg")
            return cell
    }
  
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

