//
//  LineViewController.swift
//  TimeVisualizer
//
//  Created by Shahad Nasser on 25/12/2021.
//

import UIKit
import Charts

class LineViewController: UIViewController, ChartViewDelegate{

    var lineChart = LineChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lineChart.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        lineChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        lineChart.center = view.center
        view.addSubview(lineChart)
        
        var entries = [ChartDataEntry]()
        for i in 0..<10 {
            entries.append(ChartDataEntry(x: Double(i), y: Double(i)))
        }
        
        let set = LineChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.material()
        let data = LineChartData(dataSet: set)
        lineChart.data = data
        
    }
    
    
}
