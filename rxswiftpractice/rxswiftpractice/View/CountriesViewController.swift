//
//  CountriesViewController.swift
//  rxswiftpractice
//
//  Created by Daniel No on 10/31/17.
//  Copyright © 2017 Daniel No. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CountriesViewController: UIViewController {
    
    let viewModel = CountriesViewModel()
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

extension CountriesViewController{
    
    func setupSearchBarObserver(){
        searchBar
            .rx.text
            .orEmpty
            .subscribe(onNext: { (query) in
                self.viewModel.searchText(searchText: query)
                print(query)
            }).disposed(by: disposeBag)

    }
    
    func setupTableViewObserver(){
        viewModel.shownCountryData.asObservable().bind(to: tableView.rx.items(cellIdentifier: textCellIdentifier, cellType: TextTableViewCell.self)){ (row,element,cell) in
            cell.textLbl.text = element
        }.disposed(by: disposeBag)

    }

}
