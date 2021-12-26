//
//  Week.swift
//  TimeVisualizer
//
//  Created by Shahad Nasser on 26/12/2021.
//

import Foundation
class Week{
    var days: [Day]
    
    init(){
        days = [
            Day(name: DayEnum.Sunday),
            Day(name: DayEnum.Monday),
            Day(name: DayEnum.Tuesday),
            Day(name: DayEnum.Wednesday),
            Day(name: DayEnum.Thursday),
            Day(name: DayEnum.Friday),
            Day(name: DayEnum.Saturday)
        ]
    }
    
    func addTask(text: String, time: TimeEnum, day: DayEnum)-> Bool{
        for d in days {
            if d.name == day {
                d.task = Task(text: text, time: time)
                return true
            }
        }
        return false
    }
    
    func getTask(time: TimeEnum, day: DayEnum)-> String{
        for d in days {
            if d.name == day{
                return d.task?.text ?? ""
            }
        }
        return ""
    }
    
    
}


class Day{
    var name: DayEnum
    var task: Task?

    init(name: DayEnum){
        self.name = name
    }
}

struct Task{
    let text: String
    let time: TimeEnum
}
