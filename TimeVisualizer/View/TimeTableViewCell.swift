//
//  TimeTableViewCell.swift
//  TimeVisualizer
//
//  Created by Shahad Nasser on 26/12/2021.
//

import UIKit

class TimeTableViewCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var taskTextField: UITextField!
    
    var scheduleDelegate: ScheduleDelegate?
    
    @IBAction func textFieldEdited(_ sender: UITextField) {
        print("celll")
        scheduleDelegate?.writeTask(text: sender.text ?? "", time: TimeEnum(rawValue: timeLabel.text!)!)
    }

}
