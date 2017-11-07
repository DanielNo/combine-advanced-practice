//
//  FirstViewModel.swift
//  rxswiftpractice
//
//  Created by Daniel No on 10/31/17.
//  Copyright © 2017 Daniel No. All rights reserved.
//

import Foundation
import RxSwift

public class FirstViewModel{
    
    let countryData : Variable<[String]> = {
        do {
            if let path = Bundle.main.path(forResource: "countries", ofType: "txt"){
                let data = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
                return Variable(data.components(separatedBy: "\n"))
            }
        } catch let err as NSError {
            print("file error : \(err)")
        }
        return Variable([])
    }()
    
    var shownCountryData = Variable<[String]>([])
    
}
