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
    @IBOutlet var PickerView : UIPickerView!
    
    var pickerDataSource = ["가평군", "고양시", "과천시", "광주시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "화성군", "화성시"]
    
    var selectCity = "&sigun_nm=가평군"
    
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
            selectCity = "&sigun_nm=가평군"
            break
        case 1 :
            selectCity = "&sigun_nm=고양시"
            break
        case 2 :
            selectCity = "&sigun_nm=과천시"
            break
        case 3 :
            selectCity = "&sigun_nm=광주시"
            break
        case 4 :
            selectCity = "&sigun_nm=군포시"
            break
        case 5 :
            selectCity = "&sigun_nm=김포시"
            break
        case 6 :
            selectCity = "&sigun_nm=남양주시"
            break
        case 7 :
            selectCity = "&sigun_nm=동두천시"
            break
        case 8 :
            selectCity = "&sigun_nm=부천시"
            break
        case 9 :
            selectCity = "&sigun_nm=성남시"
            break
        case 10 :
            selectCity = "&sigun_nm=수원시"
            break
        case 11 :
            selectCity = "&sigun_nm=시흥시"
            break
        case 12 :
            selectCity = "&sigun_nm=안산시"
            break
        case 13 :
            selectCity = "&sigun_nm=안성시"
            break
        case 14 :
            selectCity = "&sigun_nm=안양시"
            break
        case 15 :
            selectCity = "&sigun_nm=양주시"
            break
        case 16 :
            selectCity = "&sigun_nm=양평군"
            break
        case 17 :
            selectCity = "&sigun_nm=여주시"
            break
        case 18 :
            selectCity = "&sigun_nm=오산시"
            break
        case 19 :
            selectCity = "&sigun_nm=용인시"
            break
        case 20 :
            selectCity = "&sigun_nm=의왕시"
            break
        case 21 :
            selectCity = "&sigun_nm=의정부시"
            break
        case 22 :
            selectCity = "&sigun_nm=이천시"
            break
        case 23 :
            selectCity = "&sigun_nm=파주시"
            break
        case 24 :
            selectCity = "&sigun_nm=평택시"
            break
        case 25 :
            selectCity = "&sigun_nm=포천시"
            break
        case 26 :
            selectCity = "&sigun_nm=화성군"
            break
        case 27 :
            selectCity = "&sigun_nm=화성시"
            break
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "sequeToUniversityList"
        {
            if let navController = segue.destination as? UINavigationController
            {
                if let tableViewController = navController.topViewController as? TableViewController
                {
                    tableViewController.selectedCity = selectCity
                }
            }
        }
    }
    
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

    @IBAction func backToPickerViewController(segue:UIStoryboardSegue)
    {
        
    }
}

