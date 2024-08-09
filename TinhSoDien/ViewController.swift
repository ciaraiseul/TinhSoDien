import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var kWhTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    var totalCost: Double = 0.0
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard let kWhText = kWhTextField.text, let kWh = Double(kWhText) else {
            resultLabel.text = "Vui lòng nhập số kWh hợp lệ."
            return
        }
        totalCost = calculateElectricityBill(for: kWh)
        resultLabel.text = String(format: "Tổng tiền điện: %.2f VND", totalCost)
    }
    
    
    
    @IBAction func exitButtonTapped(_ sender: UIButton) {
        exit(0)
    }
    
    func calculateElectricityBill(for kWh: Double) -> Double {
        var cost: Double = 0
        var remainingKWh = kWh
        
        if remainingKWh > 400 {
            cost += (remainingKWh - 400) * 2.927
            remainingKWh = 400
        }
        if remainingKWh > 300 {
            cost += (remainingKWh - 300) * 2.834
            remainingKWh = 300
        }
        if remainingKWh > 200 {
            cost += (remainingKWh - 200) * 2.536
            remainingKWh = 200
        }
        if remainingKWh > 100 {
            cost += (remainingKWh - 100) * 2.014
            remainingKWh = 100
        }
        if remainingKWh > 50 {
            cost += (remainingKWh - 50) * 1.734
            remainingKWh = 50
        }
        cost += remainingKWh * 1.678
        
        return cost
    }
}
