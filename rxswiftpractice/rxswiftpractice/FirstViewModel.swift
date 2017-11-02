//
//  FirstViewModel.swift
//  rxswiftpractice
//
//  Created by Daniel No on 10/31/17.
//  Copyright © 2017 Daniel No. All rights reserved.
//

import Foundation

public struct FirstViewModel{
    
    let countryData : [String] = {
        do {
            if let path = Bundle.main.path(forResource: "countries", ofType: "txt"){
                let data = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
                return data.components(separatedBy: "\n")
            }
        } catch let err as NSError {
            print("file error : \(err)")
        }
        return []
    }()
    
}
