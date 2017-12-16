//
//  TableViewCell.swift
//  Compiler Project Token
//
//  Created by Arvin Loripour on 9/25/1396 AP.
//  Copyright © 1396 AP Arvin Loripour. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
