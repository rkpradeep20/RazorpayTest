import UIKit
import Razorpay

class ViewController: UIViewController {
    
    let name = "ViewController - Root VC"
    
    var razorpay: Razorpay!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // ----------
    // MARK: - Event Action
    // ----------
    @IBAction func pay_ButtonPressed(sender: UIButton) {
        
        self.razorpay = Razorpay.initWithKey("rzp_test_PEbBHVNMJEDVqJ", andDelegate: self)
        
        let totalOrderAmout_Paisa = 1000*100
        
        let dic = ["amount": totalOrderAmout_Paisa, "Name": "Test", "description": "Testing Razorpay"] as [String : Any]
        
        self.razorpay.open(dic)
    }
    
}

extension ViewController: RazorpayPaymentCompletionProtocol {
    
    func onPaymentError(_ code: Int32, description str: String) {
        
        print("View Controller - \(self.name) - Payment Failure reason: \(str), Code: \(code)")
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        
        print("View Controller - \(self.name) - Payment Successful: \(payment_id)")
    }
}

