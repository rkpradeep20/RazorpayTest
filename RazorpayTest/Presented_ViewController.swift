import UIKit
import Razorpay

class Presented_ViewController: UIViewController {
    
    let name = "Presented_ViewController - Presented VC"
    
    var razorpay: Razorpay!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // ----------
    // MARK: - Event Actions
    // ----------
    @IBAction func close_ButtonPressed(sender: UIBarButtonItem) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func pay_ButtonPressed(sender: UIButton) {
        
        self.razorpay = Razorpay.initWithKey("rzp_test_PEbBHVNMJEDVqJ", andDelegate: self)
        
        let totalOrderAmout_Paisa = 1000*100
        
        let dic = ["amount": totalOrderAmout_Paisa, "Name": "Test", "description": "Testing Razorpay"] as [String : Any]
        
        print("Current View Controller: \(self.name)")
        
        self.razorpay.open(dic)
    }

}

extension Presented_ViewController: RazorpayPaymentCompletionProtocol {
    
    func onPaymentError(_ code: Int32, description str: String) {
        
        print("View Controller - \(self.name) - Payment Failure reason: \(str), Code: \(code)")
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        
        print("View Controller - \(self.name) - Payment Successful: \(payment_id)")
    }
}
