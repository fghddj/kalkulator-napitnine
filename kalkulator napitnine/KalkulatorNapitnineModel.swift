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
    var napitnina = 0.0
    var delnaVsota: Double {
        get {
            return skupno / (davekProcent + 1)
        }
    }
    
    init(skupno:Double, davekProcent:Double) {
        self.skupno = skupno
        self.davekProcent = davekProcent
    }
    
    func kalkulirajNapitninoSProcentom(napitninaProcent:Double) -> (velikostNapitnine:Double, skupno:Double) {
        let velikostNapitnine = delnaVsota * napitninaProcent
        let skupniSestevek = skupno + velikostNapitnine
        return (velikostNapitnine, skupniSestevek)
    }
    
    func vrniMozneNapitnine() -> [Int: (velikostNapitnine:Double, skupno:Double)] {
        
        let mozneNapitnineInf = [(napitnina - 0.03), (napitnina), (napitnina + 0.03)]
        
        var retval = Dictionary<Int, (velikostNapitnine:Double, skupno:Double)>()
        for mozneNapitnine in mozneNapitnineInf {
            let intPct = Int(mozneNapitnine*100)
            retval[intPct] = kalkulirajNapitninoSProcentom(mozneNapitnine)
        }
        return retval
    }
}