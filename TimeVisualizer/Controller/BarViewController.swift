//
//  BarViewController.swift
//  TimeVisualizer
//
//  Created by Shahad Nasser on 25/12/2021.
//

import UIKit
import Charts

class BarViewController: UIViewController, ChartViewDelegate {

    var barChart = BarChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barChart.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        barChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        barChart.center = view.center
    
        view.addSubview(barChart)
        
        var entries = [BarChartDataEntry]()
        for i in 0..<10 {
            entries.append(BarChartDataEntry(x: Double(i), y: Double(i)))
        }
        
        let set = BarChartDataSet(entries: entries, label: "help")
        set.colors = ChartColorTemplates.joyful()
        let data = BarChartData(dataSet: set)
        barChart.data = data
    }

}
