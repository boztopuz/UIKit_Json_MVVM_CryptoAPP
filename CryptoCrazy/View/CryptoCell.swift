//
//  CryptoCell.swift
//  CryptoCrazy
//
//  Created by Burak Öztopuz on 2.07.2022.
//

import UIKit

class CryptoCell: UITableViewCell {

    @IBOutlet var currencyCell: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
