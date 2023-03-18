//
//  CurrencyTableViewCell.swift
//  CurrencyApp
//
//  Created by Piesoft on 18/3/2566 BE.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    
    static var height: CGFloat {
        return 45.0
    }
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var ratesLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    var info: CurrencyObject? {
        didSet {
            updateInterface()
        }
    }
    
    
    func updateInterface() {
        if let item = info {
            currencyLabel.text = item.code
            ratesLabel.text = item.rate
            dateTimeLabel.text = item.dateTime
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
