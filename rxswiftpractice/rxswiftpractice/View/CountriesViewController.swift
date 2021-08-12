//
//  CountriesViewController.swift
//  rxswiftpractice
//
//  Created by Daniel No on 10/31/17.
//  Copyright © 2017 Daniel No. All rights reserved.
//

import UIKit
import Combine

class CountriesViewController: UIViewController {
    
    let viewModel = CountriesViewModel()
    var subs : Set<AnyCancellable> = Set()
    
    var canc : AnyCancellable?
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            let nib = UINib(nibName: "TextTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: textCellIdentifier)
            tableView.rowHeight = 60.0
        }
    }
    @IBOutlet weak var searchBar: UISearchBar!
    
    let textCellIdentifier = "textCell"
    
    enum Section : String{
        case main
    }
    
    lazy var datasource : UITableViewDiffableDataSource<Section,String> = {
        let dSource : UITableViewDiffableDataSource<Section,String> = UITableViewDiffableDataSource(tableView: self.tableView) { tableView, indexPath, country in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.textCellIdentifier,for: indexPath) as? TextTableViewCell
                cell?.textLbl.text = country
            return cell
        }
        return dSource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSearchBarObserver()
        self.setupTableViewObserver()
        self.setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI(){
//        self.tableView.delegate = self
        self.tableView.dataSource = self.datasource
        self.searchBar.delegate = self
        self.applyInitialSnapshot()
        self.setupCombineSubscriptions()
    }
        
    func setupCombineSubscriptions(){
        viewModel.$shownCountryData.map { countries in
            return countries
        }.sink { output in
            print(output)
        } receiveValue: { countries in
            self.applyNewSnapshot(countries)
        }.store(in: &subs)

    }
    
    func applyInitialSnapshot(){
        var snapshot = NSDiffableDataSourceSnapshot<Section,String>()
        snapshot.appendSections([.main])
        let items = viewModel.countryData
        snapshot.appendItems(items, toSection: .main)
        datasource.apply(snapshot,animatingDifferences: true)
    }
    
    func applyNewSnapshot(_ countries : [String]){
        var snapshot = NSDiffableDataSourceSnapshot<Section,String>()
        snapshot.appendSections([.main])
        snapshot.appendItems(countries, toSection: .main)
        datasource.apply(snapshot,animatingDifferences: true)
    }
    
}


extension CountriesViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text else{
            return
        }
        viewModel.searchTerm.send(text)
    }
    
    
    func setupSearchBarObserver(){

    }
    
    func setupTableViewObserver(){
//        viewModel.shownCountryData.asObservable().bind(to: tableView.rx.items(cellIdentifier: textCellIdentifier, cellType: TextTableViewCell.self)){ (row,element,cell) in
//            cell.textLbl.text = element
//        }.disposed(by: disposeBag)
        
//        viewModel.$countryData.receive(on: RunLoop.main)
//            .sink { published in
//                for item in published{
////                    tableView.dequeue
//                }
//            }
//
    }
    
    

}
