//
//  EmployeeListCell.swift
//  EmployeeDetails
//
//  Created by qrl_dev on 28/09/23.
//

import UIKit

class EmployeeListCell: UITableViewCell {
  
  @IBOutlet weak var employeName: UILabel!
  @IBOutlet weak var employeSalery: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
