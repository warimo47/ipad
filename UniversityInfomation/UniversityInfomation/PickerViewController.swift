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
    
    var pickerDataSource = ["가평군", "고양시", "과천시", "광주시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "화성시"]
    
    var selectCity = "&sigun_cd=41820"
    
    var MapX = 127.5415569
    var MapY = 37.6860579
    
    @IBAction func doneToPickerViewController(segue:UIStoryboardSegue) {}
    
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
            // selectCity = "&sigun_nm=가평군"
            selectCity = "&sigun_cd=41820"
            MapX = 127.5415569
            MapY = 37.6860579
            break
        case 1 :
            // selectCity = "&sigun_nm=고양시"
            selectCity = "&sigun_cd=41280"
            MapX = 126.8885965
            MapY = 37.7137569
            break
        case 2 :
            // selectCity = "&sigun_nm=과천시"
            selectCity = "&sigun_cd=41290"
            MapX = 126.9868944
            MapY = 37.4319931
            break
        case 3 :
            // selectCity = "&sigun_nm=광주시"
            selectCity = "&sigun_cd=41610"
            MapX = 127.157768
            MapY = 37.3578118
            break
        case 4 :
            // selectCity = "&sigun_nm=군포시"
            selectCity = "&sigun_cd=41410"
            MapX = 126.9523668
            MapY = 37.3467839
            break
        case 5 :
            // selectCity = "&sigun_nm=김포시"
            selectCity = "&sigun_cd=41570"
            MapX = 126.70877174
            MapY = 37.6066089
            break
        case 6 :
            // selectCity = "&sigun_nm=남양주시"
            selectCity = "&sigun_cd=41360"
            MapX = 127.2106344
            MapY = 37.7356307
            break
        case 7 :
            // selectCity = "&sigun_nm=동두천시"
            selectCity = "&sigun_cd=41250"
            MapX = 127.0365152
            MapY = 37.903853
            break
        case 8 :
            // selectCity = "&sigun_nm=부천시"
            selectCity = "&sigun_cd=41190"
            MapX = 126.8032325
            MapY = 37.4844799
            break
        case 9 :
            // selectCity = "&sigun_nm=성남시"
            selectCity = "&sigun_cd=41130"
            MapX = 127.1649872
            MapY = 37.4604628
            break
        case 10 :
            // selectCity = "&sigun_nm=수원시"
            selectCity = "&sigun_cd=41110"
            MapX = 127.0434206
            MapY = 37.2840406
            break
        case 11 :
            // selectCity = "&sigun_nm=시흥시"
            selectCity = "&sigun_cd=41390"
            MapX = 126.7335596
            MapY = 37.3400819
            break
        case 12 :
            // selectCity = "&sigun_nm=안산시"
            selectCity = "&sigun_cd=41270"
            MapX = 126.8348257
            MapY = 37.2959569
            break
        case 13 :
            // selectCity = "&sigun_nm=안성시"
            selectCity = "&sigun_cd=41550"
            MapX = 127.230991
            MapY = 37.0024942
            break
        case 14 :
            // selectCity = "&sigun_nm=안양시"
            selectCity = "&sigun_cd=41170"
            MapX = 126.9285107
            MapY = 37.3789465
            break
        case 15 :
            // selectCity = "&sigun_nm=양주시"
            selectCity = "&sigun_cd=41630"
            MapX = 127.0365908
            MapY = 37.8451661
            break
        case 16 :
            // selectCity = "&sigun_nm=양평군"
            selectCity = "&sigun_cd=41830"
            MapX = 127.4265444
            MapY = 37.5103511
            break
        case 17 :
            // selectCity = "&sigun_nm=여주시"
            selectCity = "&sigun_cd=41670"
            MapX = 127.6326708
            MapY = 37.2697491
            break
        case 18 :
            // selectCity = "&sigun_nm=오산시"
            selectCity = "&sigun_cd=41370"
            MapX = 127.0225021
            MapY = 37.1939696
            break
        case 19 :
            // selectCity = "&sigun_nm=용인시"
            selectCity = "&sigun_cd=41460"
            MapX = 127.1680235
            MapY = 37.2266088
            break
        case 20 :
            // selectCity = "&sigun_nm=의왕시"
            selectCity = "&sigun_cd=41430"
            MapX = 126.9782572
            MapY = 37.3785528
            break
        case 21 :
            // selectCity = "&sigun_nm=의정부시"
            selectCity = "&sigun_cd=41150"
            MapX = 127.0437985
            MapY = 37.7093275
            break
        case 22 :
            // selectCity = "&sigun_nm=이천시"
            selectCity = "&sigun_cd=41500"
            MapX = 127.5274024
            MapY = 37.209281
            break
        case 23 :
            // selectCity = "&sigun_nm=파주시"
            selectCity = "&sigun_cd=41480"
            MapX = 126.7357048
            MapY = 37.818191
            break
        case 24 :
            // selectCity = "&sigun_nm=평택시"
            selectCity = "&sigun_cd=41220"
            MapX = 127.1332472
            MapY = 36.9946853
            break
        case 25 :
            // selectCity = "&sigun_nm=포천시"
            selectCity = "&sigun_cd=41650"
            MapX = 127.1376135
            MapY = 37.8565808
            break
        case 26 :
            // selectCity = "&sigun_nm=화성시"
            selectCity = "&sigun_cd=41590"
            MapX = 126.9328244
            MapY = 37.1957976
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
                    tableViewController.MapX = MapX
                    tableViewController.MapY = MapY
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

