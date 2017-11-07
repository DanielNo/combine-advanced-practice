//
//  FirstViewController.swift
//  rxswiftpractice
//
//  Created by Daniel No on 10/31/17.
//  Copyright © 2017 Daniel No. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FirstViewController: UIViewController {
    
    let viewModel = FirstViewModel()
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            let nib = UINib(nibName: "TextTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: textCellIdentifier)
            
        }
    }
    @IBOutlet weak var searchBar: UISearchBar!
    
    let textCellIdentifier = "textCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSearchBarObserver()
        self.setupTableViewObserver()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension FirstViewController{
    
    func setupSearchBarObserver(){
        searchBar
            .rx.text
            .orEmpty
            .subscribe(onNext: { (query) in
                self.viewModel.countryData.asObservable().map{
                    $0.filter {
                        return query.count == 0 ? true : $0.lowercased().contains(query.lowercased())
                    }
                }
                    .bind(to: self.viewModel.shownCountryData)
                print(query)
                    
            }, onError: { (err) in
                
            }, onCompleted: {
                
            }) {
                
        }

    }
    
    func setupTableViewObserver(){
        viewModel.shownCountryData.asObservable().bind(to: tableView.rx.items(cellIdentifier: textCellIdentifier, cellType: TextTableViewCell.self)){ (row,element,cell) in
            print("row : \(row)")
            print(element)
            cell.textLbl.text = element
            
        }.disposed(by: disposeBag)

    }

}
