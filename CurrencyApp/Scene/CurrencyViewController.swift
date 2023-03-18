//
//  CurrencyViewController.swift
//  CurrencyApp
//
//  Created by Piesoft on 18/3/2566 BE.
//

import UIKit
import AAPickerView
import Realm
import RealmSwift

class CurrencyViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var btcLabel: UILabel!
    @IBOutlet weak var currencyTextField: UITextField!
    @IBOutlet var currenciesLabel: [UILabel]!
    @IBOutlet var ratesLabel: [UILabel]!
    @IBOutlet weak var picker: AAPickerView!
    @IBOutlet var views: [UIView]!
    
    var viewModel = CurrencyViewModel()
    var chartCurrencyInfo: ChartCurrencyInfo?
    var currencies = [CurrencyDetailInfo]()
    var selectedCurrency = 0
    var timer : Timer? = nil {
        willSet {
            timer?.invalidate()
        }
    }
    
    var isFirstTime = true
    var isFirstStartTimer = true
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        if isFirstTime {
            fetchData()
        }
    }
    
    func setupInterface() {
        dateTimeLabel.text = self.chartCurrencyInfo?.time?.updatedISO.toDate()?.toString(format: "EEEE, MMM d, yyyy")
        ratesLabel[0].text = self.chartCurrencyInfo?.bpi?.USD?.rate
        ratesLabel[1].text = self.chartCurrencyInfo?.bpi?.GBP?.rate
        ratesLabel[2].text = self.chartCurrencyInfo?.bpi?.EUR?.rate
        
        let dateTimeUpdate = self.chartCurrencyInfo?.time?.updatedISO.toDate()?.toString()
        self.chartCurrencyInfo?.bpi?.USD?.dateTime = dateTimeUpdate ?? ""
        self.chartCurrencyInfo?.bpi?.GBP?.dateTime = dateTimeUpdate ?? ""
        self.chartCurrencyInfo?.bpi?.EUR?.dateTime = dateTimeUpdate ?? ""
        
        //add Data
        if let currency = self.chartCurrencyInfo?.bpi {
            currencies.append(currency.USD!)
            currencies.append(currency.GBP!)
            currencies.append(currency.EUR!)
            
            //Realm
            let USDInfo = CurrencyObject(code: currency.USD?.code ?? "", rate: currency.USD?.rate ?? "", dateTime: currency.USD?.dateTime ?? "")
            let GBPInfo = CurrencyObject(code: currency.GBP?.code ?? "", rate: currency.GBP?.rate ?? "", dateTime: currency.GBP?.dateTime ?? "")
            let EURInfo = CurrencyObject(code: currency.EUR?.code ?? "", rate: currency.EUR?.rate ?? "", dateTime: currency.EUR?.dateTime ?? "")
            try! realm.write {
                realm.add(USDInfo)
                realm.add(GBPInfo)
                realm.add(EURInfo)
            }
        }
        
        if isFirstTime {
            configPicker()
            currenciesLabel[0].text = self.chartCurrencyInfo?.bpi?.USD?.code
            currenciesLabel[1].text = self.chartCurrencyInfo?.bpi?.GBP?.code
            currenciesLabel[2].text = self.chartCurrencyInfo?.bpi?.EUR?.code
            currencyTextField.text = "1"
            calculatorExchange()
        }
        
        self.isFirstTime = false
        self.tableView.reloadData()
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
            self.selectedCurrency = index as! Int
            print("selectedString ", currencyNames[index as! Int])
            self.calculatorExchange()
            
        }
    }
    
    @objc func fetchData() {
        viewModel.requestData { isSucces in
            if isSucces {
                if self.isFirstStartTimer {
                    self.startTimer()
                    self.isFirstStartTimer = false
                }
                self.chartCurrencyInfo = self.viewModel.info
                self.setupInterface()
            } else {
                //alert Error
            }
        }
    }
    
    func calculatorExchange() {
        let btc = Double(currencyTextField.text ?? "") ?? 0.0
        let sum = self.currencies[selectedCurrency].rate_float * btc
        btcLabel.text = sum.toString()
    }
}

extension CurrencyViewController: UITextFieldDelegate {
    @objc func textFieldDidChange(_ textField: UITextField) {
        calculatorExchange()
    }
}

extension CurrencyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realm.objects(CurrencyObject.self).count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CurrencyTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTableViewCell", for: indexPath) as! CurrencyTableViewCell
        cell.info = realm.objects(CurrencyObject.self)[indexPath.row]
        return cell
    }
}
