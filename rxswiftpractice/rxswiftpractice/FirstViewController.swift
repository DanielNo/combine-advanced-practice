//
//  FirstViewController.swift
//  rxswiftpractice
//
//  Created by Daniel No on 10/31/17.
//  Copyright © 2017 Daniel No. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let viewModel = FirstViewModel()

    @IBOutlet weak var tableView: UITableView!{
        didSet{
            let nib = UINib(nibName: "TextTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "textCell")
        }
    }
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension FirstViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TextTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "textCell") as! TextTableViewCell
        cell.textLbl.text = viewModel.countryData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = viewModel.countryData.count
        return rows
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        let sections = viewModel.countryData.count > 0 ? viewModel.countryData.count : 0
        return sections
    }
}

extension FirstViewController : UISearchBarDelegate{
    
}
