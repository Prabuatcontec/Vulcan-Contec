//
//  CellTableViewCell.swift
//  Vulcan-Contec
//
//  Created by Prabu on 27/12/20.
//  Copyright © 2020 Prabu. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var value: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
