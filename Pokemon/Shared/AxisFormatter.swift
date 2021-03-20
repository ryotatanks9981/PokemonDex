import Charts


class XAxisFormatter: AxisValueFormatter {
    
    let titles = ["HP", "Attack", "Defense", "SpAttack", "SpDefense", "Speed"]
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        titles[Int(value) % titles.count]
    }
}

class YAxisFormatter: AxisValueFormatter {
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        ""
    }
}
