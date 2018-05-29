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
    var SIGUN_NM = NSMutableString()
    var SCHOOL_DIV_NM = NSMutableString()
    var PLVTINST_DIV_NM = NSMutableString()
    var REFINE_LOTNO_ADDR = NSMutableString()
    var REFINE_ROADNM_ADDR = NSMutableString()
    var REFINE_ZIP_CD = NSMutableString()
    var Addr = NSMutableString()
    var XPos = NSMutableString()
    var YPos = NSMutableString()
    
    var MapX = 0.0
    var MapY = 0.0
    
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
            SIGUN_NM = NSMutableString()
            SIGUN_NM = ""
            SCHOOL_DIV_NM = NSMutableString()
            SCHOOL_DIV_NM = ""
            PLVTINST_DIV_NM = NSMutableString()
            PLVTINST_DIV_NM = ""
            REFINE_LOTNO_ADDR = NSMutableString()
            REFINE_LOTNO_ADDR = ""
            REFINE_ROADNM_ADDR = NSMutableString()
            REFINE_ROADNM_ADDR = ""
            REFINE_ZIP_CD = NSMutableString()
            REFINE_ZIP_CD = ""
            Addr = NSMutableString()
            Addr = ""
            XPos = NSMutableString()
            XPos = ""
            YPos = NSMutableString()
            YPos = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if element.isEqual(to: "FACLT_NM")
        {
            UniversityName.append(string)
        }
        else if element.isEqual(to: "SIGUN_NM")
        {
            SIGUN_NM.append(string)
        }
        else if element.isEqual(to: "SCHOOL_DIV_NM")
        {
            SCHOOL_DIV_NM.append(string)
        }
        else if element.isEqual(to: "PLVTINST_DIV_NM")
        {
            PLVTINST_DIV_NM.append(string)
        }
        else if element.isEqual(to: "REFINE_LOTNO_ADDR")
        {
            REFINE_LOTNO_ADDR.append(string)
        }
        else if element.isEqual(to: "REFINE_ROADNM_ADDR")
        {
            Addr.append(string)
            REFINE_ROADNM_ADDR.append(string)
        }
        else if element.isEqual(to: "REFINE_ZIP_CD")
        {
            REFINE_ZIP_CD.append(string)
        }
        else if element.isEqual(to: "REFINE_WGS84_LAT")
        {
            XPos.append(string)
        }
        else if element.isEqual(to: "REFINE_WGS84_LOGT")
        {
            YPos.append(string)
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
            
            if !SIGUN_NM.isEqual(nil)
            {
                elements.setObject(SIGUN_NM, forKey: "SIGUN_NM" as NSCopying)
            }
            
            if !SCHOOL_DIV_NM.isEqual(nil)
            {
                elements.setObject(SCHOOL_DIV_NM, forKey: "SCHOOL_DIV_NM" as NSCopying)
            }
            
            if !PLVTINST_DIV_NM.isEqual(nil)
            {
                elements.setObject(PLVTINST_DIV_NM, forKey: "PLVTINST_DIV_NM" as NSCopying)
            }
            
            if !REFINE_LOTNO_ADDR.isEqual(nil)
            {
                elements.setObject(REFINE_LOTNO_ADDR, forKey: "REFINE_LOTNO_ADDR" as NSCopying)
            }
            
            if !REFINE_ROADNM_ADDR.isEqual(nil)
            {
                elements.setObject(REFINE_ROADNM_ADDR, forKey: "REFINE_ROADNM_ADDR" as NSCopying)
            }
            
            if !REFINE_ZIP_CD.isEqual(nil)
            {
                elements.setObject(REFINE_ZIP_CD, forKey: "REFINE_ZIP_CD" as NSCopying)
            }
            
            if !Addr.isEqual(nil)
            {
                elements.setObject(Addr, forKey: "REFINE_ROADNM_ADDR" as NSCopying)
            }
            
            if !XPos.isEqual(nil)
            {
                elements.setObject(XPos, forKey: "REFINE_WGS84_LAT" as NSCopying)
            }
            
            if !YPos.isEqual(nil)
            {
                elements.setObject(YPos, forKey: "REFINE_WGS84_LOGT" as NSCopying)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segueToMapView"
        {
            if let mapViewController = segue.destination as? MapViewController
            {
                mapViewController.posts = posts
                mapViewController.MapX = MapX
                mapViewController.MapY = MapY
            }
        }
        
        if segue.identifier == "segueToDetailView"
        {
            if let detailTableViewController = segue.destination as? DetailTableViewController
            {
                detailTableViewController.posts =
                    [UniversityName as String,
                     SIGUN_NM as String,
                     SCHOOL_DIV_NM as String,
                     PLVTINST_DIV_NM as String,
                     REFINE_LOTNO_ADDR as String,
                     REFINE_ROADNM_ADDR as String,
                     REFINE_ZIP_CD as String]
            }
        }
    }
}
