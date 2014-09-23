//
//  KalkulatorNapitnineModel.swift
//  kalkulator napitnine
//
//  Created by Blaz on 22/09/14.
//  Copyright (c) 2014 Blaz. All rights reserved.
//

import Foundation


class KalkulatorNapitnineModel {
    var skupno = 0.0
    var davekProcent = 0.0
    var delnaVsota: Double {
        get {
            return skupno / (davekProcent + 1)
        }
    }
    
    init(skupno:Double, davekProcent:Double) {
        self.skupno = skupno
        self.davekProcent = davekProcent
    }
    
    func kalkulirajNapitninoSProcentom(napitninaProcent:Double) -> Double {
        return delnaVsota * napitninaProcent
    }
    
    func vrniMozneNapitnine() -> [Int: Double] {
        
        let mozneNapitnineInf = [0.15, 0.18, 0.20]
        
        var retval = Dictionary<Int, Double>()
        for mozneNapitnine in mozneNapitnineInf {
            let intPct = Int(mozneNapitnine*100)
            retval[intPct] = kalkulirajNapitninoSProcentom(mozneNapitnine)
        }
        return retval
    }
}