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
    @IBOutlet var ratesLabel: [UILabel]!
    
    var viewModel = CurrencyViewModel()
    var chartCurrencyInfo: ChartCurrencyInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
    }
    
    func setupInterface() {
        currenciesLabel[0].text = self.chartCurrencyInfo?.bpi?.USD?.code
        currenciesLabel[1].text = self.chartCurrencyInfo?.bpi?.GBP?.code
        currenciesLabel[2].text = self.chartCurrencyInfo?.bpi?.EUR?.code
        
        ratesLabel[0].text = self.chartCurrencyInfo?.bpi?.USD?.rate
        ratesLabel[1].text = self.chartCurrencyInfo?.bpi?.GBP?.rate
        ratesLabel[2].text = self.chartCurrencyInfo?.bpi?.EUR?.rate
    }
    
    func fetchData() {
        viewModel.requestData { isSucces in
            if isSucces {
                self.chartCurrencyInfo = self.viewModel.info
                self.setupInterface()
            } else {
                //alert Error
            }
        }
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
