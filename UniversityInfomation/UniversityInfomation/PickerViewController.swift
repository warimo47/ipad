//
//  ViewController.swift
//  UniversityInfomation
//
//  Created by kpugame on 2018. 5. 10..
//  Copyright © 2018년 BKS. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    @IBOutlet var OutletBackToMainButton: UIBarButtonItem!
    
    var pickerDataSource = ["가평군", "고양시", "과천시", "광주시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "화성군", "화성시"]
    
    var selectSity : String = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return pickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        switch row {
        case 0 :
            selectSity = "&sigln_nm=가평군"
            break
        case 1 :
            selectSity = "&sigln_nm=고양시"
            break
        case 2 :
            selectSity = "&sigln_nm=과천시"
            break
        case 3 :
            selectSity = "&sigln_nm=광주시"
            break
        case 4 :
            selectSity = "&sigln_nm=군포시"
            break
        case 5 :
            selectSity = "&sigln_nm=김포시"
            break
        case 6 :
            selectSity = "&sigln_nm=남양주시"
            break
        case 7 :
            selectSity = "&sigln_nm=동두천시"
            break
        case 8 :
            selectSity = "&sigln_nm=부천시"
            break
        case 9 :
            selectSity = "&sigln_nm=성남시"
            break
        case 10 :
            selectSity = "&sigln_nm=수원시"
            break
        case 11 :
            selectSity = "&sigln_nm=시흥시"
            break
        case 12 :
            selectSity = "&sigln_nm=안산시"
            break
        case 13 :
            selectSity = "&sigln_nm=안성시"
            break
        case 14 :
            selectSity = "&sigln_nm=안양시"
            break
        case 15 :
            selectSity = "&sigln_nm=양주시"
            break
        case 16 :
            selectSity = "&sigln_nm=양평군"
            break
        case 17 :
            selectSity = "&sigln_nm=여주시"
            break
        case 18 :
            selectSity = "&sigln_nm=오산시"
            break
        case 19 :
            selectSity = "&sigln_nm=용인시"
            break
        case 20 :
            selectSity = "&sigln_nm=의왕시"
            break
        case 21 :
            selectSity = "&sigln_nm=의정부시"
            break
        case 22 :
            selectSity = "&sigln_nm=이천시"
            break
        case 23 :
            selectSity = "&sigln_nm=파주시"
            break
        case 24 :
            selectSity = "&sigln_nm=평택시"
            break
        case 25 :
            selectSity = "&sigln_nm=포천시"
            break
        case 26 :
            selectSity = "&sigln_nm=화성군"
            break
        case 27 :
            selectSity = "&sigln_nm=화성시"
            break
        default:
            break
        }
    }
    
    @IBOutlet var PickerView : UIPickerView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.PickerView.delegate = self
        self.PickerView.dataSource = self
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

