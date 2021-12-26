//
//  ScheduleDelegate.swift
//  TimeVisualizer
//
//  Created by Shahad Nasser on 26/12/2021.
//

import Foundation
protocol ScheduleDelegate{
    func writeTask(text: String, time: TimeEnum)
}
