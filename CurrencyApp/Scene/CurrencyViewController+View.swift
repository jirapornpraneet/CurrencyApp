//
//  CurrencyViewController+View.swift
//  CurrencyApp
//
//  Created by Piesoft on 18/3/2566 BE.
//

import Foundation
import UIKit

extension CurrencyViewController {
    
    func setupView() {
        setupTableView()
        setupTextField()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CurrencyTableViewCell", bundle: nil), forCellReuseIdentifier: "CurrencyTableViewCell")
    }
    
    func setupTextField() {
        currencyTextField.delegate = self
        currencyTextField.addTarget(self, action: #selector(CurrencyViewController.textFieldDidChange(_:)), for: .editingChanged)
        
    }
}
