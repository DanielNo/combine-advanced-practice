//
//  CountriesViewModel.swift
//  rxswiftpractice
//
//  Created by Daniel No on 10/31/17.
//  Copyright © 2017 Daniel No. All rights reserved.
//

import Foundation
//import RxSwift
import Combine

class CountriesViewModel{
    
    var countryData : [String] = {
        do {
            if let path = Bundle.main.path(forResource: "countries", ofType: "txt"){
                let data = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
                let comps = data.components(separatedBy: "\n")
                return comps            }
        } catch let err as NSError {
            print("file error : \(err)")
        }
        return []
    }()
    var subs : Set<AnyCancellable> = Set()
    
    @Published var shownCountryData : [String] = []
    lazy var searchTerm : CurrentValueSubject<String,Never> = CurrentValueSubject("")
    
    init() {
        shownCountryData = countryData
        self.setupSubs()
    }

    private func setupSubs(){
        searchTerm.sink {[unowned self] term in
            print("searched : \(term)")
            self.shownCountryData = countryData.filter({ str in
                str.contains(term)
            })
        }.store(in: &subs)

    }
    
}
