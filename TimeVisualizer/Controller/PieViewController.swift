//
//  PieViewController.swift
//  TimeVisualizer
//
//  Created by Shahad Nasser on 25/12/2021.
//

import UIKit
import Charts

class PieViewController: UIViewController, ChartViewDelegate{

    var pieChart = PieChartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        pieChart.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pieChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        pieChart.center = view.center
        view.addSubview(pieChart)
        
        var entries = [ChartDataEntry]()
        for i in 0..<10 {
            entries.append(ChartDataEntry(x: Double(i), y: Double(i)))
        }
        
        let set = PieChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.pastel()
        let data = PieChartData(dataSet: set)
        pieChart.data = data
    }
}
