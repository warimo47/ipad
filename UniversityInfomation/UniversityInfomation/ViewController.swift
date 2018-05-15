//
//  ViewController.swift
//  UniversityInfomation
//
//  Created by kpugame on 2018. 5. 15..
//  Copyright © 2018년 BKS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate
{
    var parser = XMLParser()
    
    var posts = NSMutableArray()

    var elements = NSMutableDictionary()
    var element = NSString()

    var title1 = NSMutableString()
    
    var strUniPosUrl = "https://openapi.gg.go.kr/Jnclluniv?KEY=6ec3d4fbb5234452be28d5868db20223&psize=300"
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf: URL(string: strUniPosUrl)!)!
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
            title1 = NSMutableString()
            title1 = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if element.isEqual(to: "title")
        {
            title1.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqual(to: "row")
        {
            if !title1.isEqual(nil)
            {
                elements.setObject(title1, forKey: "title" as NSCopying)
            }
            
            posts.add(elements)
        }
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        beginParsing()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
