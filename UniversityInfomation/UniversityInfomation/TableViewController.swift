//
//  TableViewController.swift
//  UniversityInfomation
//
//  Created by kpugame on 2018. 5. 24..
//  Copyright © 2018년 BKS. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, XMLParserDelegate
{
    
    
    var parser = XMLParser()
    
    var posts = NSMutableArray()
    
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var UniversityName = NSMutableString()
    
    var strUniPosUrl = "https://openapi.gg.go.kr/Jnclluniv?key=6ec3d4fbb5234452be28d5868db20223&psize=300"
    
    var selectedCity = ""
    
    func beginParsing()
    {
        posts = []
        let url = strUniPosUrl + selectedCity
        parser = XMLParser(contentsOf: URL(string: url)!)!
        parser.delegate = self
        
        parser.parse()
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
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if element.isEqual(to: "FACLT_NM")
        {
            UniversityName.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqual(to: "row")
        {
            if !UniversityName.isEqual(nil)
            {
                elements.setObject(UniversityName, forKey: "FACLT_NM" as NSCopying)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityName", for: indexPath)
        
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "FACLT_NM")
            as! NSString as String
        
        return cell
    }

}
