//
//  ViewController.swift
//  kalkulator napitnine
//
//  Created by Blaz on 22/09/14.
//  Copyright (c) 2014 Blaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var skupajTekstPolje: UITextField!
    @IBOutlet var davekPctSlider: UISlider!
    @IBOutlet var davekPctLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var napitninaPctSlider: UISlider!
    @IBOutlet var napitninaPctLabel: UILabel!

    
    let kalkulatorNapitnine = KalkulatorNapitnineModel(skupno: 17.25, davekProcent: 0.22)
    var mozneNapitnine = Dictionary<Int, (velikostNapitnine:Double, skupno:Double)>()
    var sortedKeys: [Int] = []
    
    func refreshUI() {
        // skupajTekstPolje.text = String(format: "%0.2f", kalkulatorNapitnine.skupno)
        davekPctSlider.value = Float(kalkulatorNapitnine.davekProcent) * 100.0
        davekPctLabel.text = "Davek (\(Int(davekPctSlider.value))%)"
        napitninaPctSlider.value = Float(kalkulatorNapitnine.napitnina) * 100.0
        napitninaPctLabel.text = "Napitnina (\(Int(napitninaPctSlider.value))%)"
    }

    @IBAction func izracunajTapped(sender: AnyObject) {
        kalkulatorNapitnine.skupno = Double((skupajTekstPolje.text as NSString).doubleValue)
        mozneNapitnine = kalkulatorNapitnine.vrniMozneNapitnine()
        sortedKeys = sorted(Array(mozneNapitnine.keys))
        tableView.reloadData()
    }
    @IBAction func davekProcentSpremenjen(sender: AnyObject) {
        kalkulatorNapitnine.davekProcent = Double(davekPctSlider.value) / 100.0
        refreshUI()
    }
    
    @IBAction func napitninaProcentSpremenjen(sender: AnyObject) {
        kalkulatorNapitnine.napitnina = Double(napitninaPctSlider.value) / 100.0
        refreshUI()
    }
    
    
    @IBAction func viewTapped(sender: AnyObject) {
        skupajTekstPolje.resignFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedKeys.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: nil)
        let procentNapitnine = sortedKeys[indexPath.row]
        let velikostNapitnine = mozneNapitnine[procentNapitnine]!.velikostNapitnine
        let skupno = mozneNapitnine[procentNapitnine]!.skupno
        
        cell.textLabel.text = "\(procentNapitnine)%:"
        cell.detailTextLabel!.text = String(format: "Napitnina: %0.2f €, Skupno: %0.2f €", velikostNapitnine, skupno)
        return cell
    }
    

}

