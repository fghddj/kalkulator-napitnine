//
//  ViewController.swift
//  kalkulator napitnine
//
//  Created by Blaz on 22/09/14.
//  Copyright (c) 2014 Blaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var skupajTekstPolje: UITextField!
    @IBOutlet var davekPctSlider: UISlider!
    @IBOutlet var davekPctLabel: UILabel!
    @IBOutlet var rezultatTextView: UITextView!
    
    @IBAction func izracunajTapped(sender: AnyObject) {
        kalkulatorNapitnine.skupno = Double((skupajTekstPolje.text as NSString).doubleValue)
        let mozneNapitnine = kalkulatorNapitnine.vrniMozneNapitnine()
        var rezultati = ""
        
        /*
        for (napitninaProcent, napitninaVrednost) in mozneNapitnine {
        rezultati += "\(napitninaProcent)%: \(napitninaVrednost)\n"
        }
        */
        
        var keys = Array(mozneNapitnine.keys)
        sort(&keys)
        for napitninaProcent in keys {
            let napitninaVrednost = mozneNapitnine[napitninaProcent]!
            let lepaVrednostNapitnine = String(format:"%.2f", napitninaVrednost)
            rezultati += "\(napitninaProcent)%: \(lepaVrednostNapitnine)\n"
        }
        rezultatTextView.text = rezultati
    }
    @IBAction func davekProcentSpremenjen(sender: AnyObject) {
        kalkulatorNapitnine.davekProcent = Double(davekPctSlider.value) / 100.0
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
    
    let kalkulatorNapitnine = KalkulatorNapitnineModel(skupno: 33.25, davekProcent: 0.06)
    
    func refreshUI() {
        skupajTekstPolje.text = String(format: "%0.2f", kalkulatorNapitnine.skupno)
        davekPctSlider.value = Float(kalkulatorNapitnine.davekProcent) * 100.0
        davekPctLabel.text = "Davek (\(Int(davekPctSlider.value))%)"
        rezultatTextView.text = ""
    }


}

