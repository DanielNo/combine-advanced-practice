//
//  ReactiveGreetingViewController.swift
//  rxswiftpractice
//
//  Created by Daniel No on 11/12/17.
//  Copyright © 2017 Daniel No. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ReactiveGreetingViewController: UIViewController {

    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var promptTextField: UITextField!
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        promptTextField.rx.text.map {return ($0?.count == 0) ? "Enter your name" : "Hello \($0!)" }
            .bind(to: textLbl.rx.text).disposed(by: disposeBag)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
