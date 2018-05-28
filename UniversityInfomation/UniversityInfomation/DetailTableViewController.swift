//
//  DetailTableViewController.swift
//  UniversityInfomation
//
//  Created by kpugame on 2018. 5. 28..
//  Copyright © 2018년 BKS. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController, XMLParserDelegate
{
    @IBOutlet var DetailTableView: UITableView!
    
    var parser = XMLParser()
    
    var posts = NSMutableArray()
    var subPosts = NSMutableArray()
    
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var UniversityName = NSMutableString()
    var DepartmentName = NSMutableString()
    var DanDivName = NSMutableString()
    var MJRStateName = NSMutableString()
    
    let strUniInfoUrl = "https://openapi.gg.go.kr/Univmjrm?key=6ec3d4fbb5234452be28d5868db20223&psize=1000&pindex=1"
    
    func beginParsing()
    {
        posts = []
        subPosts = []
        
        /*
        for i in 1..<10
        {
            let url = strUniInfoUrl + String(i)
            
            // print(url)
            parser = XMLParser(contentsOf: URL(string: url)!)!
            parser.delegate = self
            parser.parse()
        }
         */
        
        parser = XMLParser(contentsOf: URL(string: strUniInfoUrl)!)!
        parser.delegate = self
        parser.parse()
        
        // DetailTableView!.reloadData()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName as NSString
        
        if (elementName as NSString).isEqual(to: "row")
        {
            elements = NSMutableDictionary()
            elements = [ : ]
            UniversityName = NSMutableString()
            UniversityName = ""
            DepartmentName = NSMutableString()
            DepartmentName = ""
            DanDivName = NSMutableString()
            DanDivName = ""
            MJRStateName = NSMutableString()
            MJRStateName = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if element.isEqual(to: "SCHOOL_NM")
        {
            UniversityName.append(string)
        }
        else if element.isEqual(to: "UNDSTUD_KWA_NM")
        {
            DepartmentName.append(string)
        }
        else if element.isEqual(to: "DAN_DIV_NM")
        {
            DanDivName.append(string)
        }
        else if element.isEqual(to: "MJR_STATE_NM")
        {
            MJRStateName.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqual(to: "row")
        {
            if !UniversityName.isEqual(nil)
            {
                elements.setObject(UniversityName, forKey: "SCHOOL_NM" as NSCopying)
            }
            
            if !DepartmentName.isEqual(nil)
            {
                elements.setObject(DepartmentName, forKey: "UNDSTUD_KWA_NM" as NSCopying)
            }
            
            if !DanDivName.isEqual(nil)
            {
                elements.setObject(DanDivName, forKey: "DAN_DIV_NM" as NSCopying)
            }
            
            if !MJRStateName.isEqual(nil)
            {
                elements.setObject(MJRStateName, forKey: "MJR_STATE_NM" as NSCopying)
            }
            
            posts.add(elements)
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        beginParsing()
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
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmentName", for: indexPath)
        
        cell.textLabel?.text = posts[indexPath.row] as? String
        cell.detailTextLabel?.text = subPosts[indexPath.row] as? String
        
        return cell
    }
}
