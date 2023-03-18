//
//  CurrencyTableViewCell.swift
//  CurrencyApp
//
//  Created by Piesoft on 18/3/2566 BE.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    
    static var height: CGFloat {
        return UITableView.automaticDimension
    }
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var ratesLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
