//
//  DetailTableViewController.swift
//  UniversityInfomation
//
//  Created by kpugame on 2018. 5. 28..
//  Copyright © 2018년 BKS. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController
{
    @IBOutlet var DetailTableView: UITableView!
    
    let postsname: [String] = ["학교명", "소재 지역", "학교 구분", "공사립 구분", "소재지 지번 주소", "소재지 도로명 주소", "우편 주소"]
    var posts: [String] = ["", "", "", "", "", "", ""]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmentName", for: indexPath)
        
        cell.textLabel?.text = postsname[indexPath.row]
        cell.textLabel?.textColor = UIColor.black
        cell.detailTextLabel?.text = posts[indexPath.row]
        cell.detailTextLabel?.textColor = UIColor.black
        
        return cell
    }
}
