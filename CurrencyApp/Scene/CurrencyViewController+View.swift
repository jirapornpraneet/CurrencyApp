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
        views.forEach { view in
            view.setupBorder()
            view.setupCorner()
        }
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
    
    func startTimer() {
        stopTimer()
        guard self.timer == nil else { return }
        self.timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector:#selector(self.fetchData) , userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        guard timer != nil else { return }
        timer?.invalidate()
        timer = nil
    }
}
