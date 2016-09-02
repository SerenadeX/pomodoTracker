//
//  TaskTableViewCell.swift
//  pomodoTracker
//
//  Created by Steve Spigarelli on 8/30/16.
//  Copyright © 2016 Steve Spigarelli. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    // MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
