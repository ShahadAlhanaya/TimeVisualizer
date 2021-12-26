//
//  ViewController.swift
//  TimeVisualizer
//
//  Created by Shahad Nasser on 25/12/2021.
//

import UIKit

class ScheduleViewController: UIViewController{
    @IBOutlet weak var datePicker: UIPickerView!
    var weekDays = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    var hours = [String]()
    
    var week = Week()
    var selectedDay = DayEnum.Sunday

    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.dataSource = self
        datePicker.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        for day in DayEnum.allCases {
            weekDays.append(day.rawValue)
        }
        for hour in TimeEnum.allCases {
            hours.append(hour.rawValue)
        }
    }

}

//=========================================================================================//
extension ScheduleViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weekDays.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return weekDays[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDay = DayEnum(rawValue: weekDays[row])!
        print(selectedDay)
//        self.tableView.reloadData()
    }
}


//=========================================================================================//
extension ScheduleViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeCell", for: indexPath) as! TimeTableViewCell
        cell.timeLabel.text = hours[indexPath.row]
        cell.taskTextField.text = week.getTask(time: TimeEnum(rawValue: hours[indexPath.row])!, day: selectedDay)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
}

//=========================================================================================//
extension ScheduleViewController: ScheduleDelegate{
    func writeTask(text: String,time: TimeEnum) {
        print("schedules")
        if week.addTask(text: text, time: time, day: selectedDay){
            print("added")
        }
    }
}

