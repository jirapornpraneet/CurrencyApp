//
//  CurrencyViewController.swift
//  CurrencyApp
//
//  Created by Piesoft on 18/3/2566 BE.
//

import UIKit

class CurrencyViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyTextField: UITextField!
    @IBOutlet var currenciesLabel: [UILabel]!
    @IBOutlet var  ratesLabel: [UILabel]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CurrencyViewController: UITextFieldDelegate {
    
}

extension CurrencyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CurrencyTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
