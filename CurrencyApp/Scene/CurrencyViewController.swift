//
//  CurrencyViewController.swift
//  CurrencyApp
//
//  Created by Piesoft on 18/3/2566 BE.
//

import UIKit
import AAPickerView

class CurrencyViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var btcLabel: UILabel!
    @IBOutlet weak var currencyTextField: UITextField!
    @IBOutlet var currenciesLabel: [UILabel]!
    @IBOutlet var ratesLabel: [UILabel]!
    @IBOutlet weak var picker: AAPickerView!
    
    var viewModel = CurrencyViewModel()
    var chartCurrencyInfo: ChartCurrencyInfo?
    var currencies = [CurrencyDetailInfo]()

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
        
        //add Data
        if let currency = self.chartCurrencyInfo?.bpi {
            currencies.append(currency.USD!)
            currencies.append(currency.GBP!)
            currencies.append(currency.EUR!)
        }
        
        configPicker()
    }
    
    func configPicker() {
        var currencyNames = [String]()
        
        for data in self.currencies {
            currencyNames.append(data.code)
        }

        if !currencyNames.isEmpty {
            picker.pickerType = .string(data: currencyNames)
        }
        
        picker.text = ""
        currencyLabel.text = currencyNames.first
        
        picker.heightForRow = 40
        picker.pickerRow.font = UIFont.systemFont(ofSize: 25)
        
        picker.toolbar.barTintColor = .darkGray
        picker.toolbar.tintColor = .black
        
        picker.valueDidSelected = { (index) in
            self.currencyLabel.text = currencyNames[index as! Int]
            self.picker.text = ""
            print("selectedString ", currencyNames[index as! Int])
            
        }
        
        picker.valueDidChange = { value in
            print(value)
        }
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
