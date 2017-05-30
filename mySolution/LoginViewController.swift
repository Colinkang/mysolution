import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!

    var result:AnyObject!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "http://116.62.103.139:8080/sjjz/app/channelAdverInfo/getAdverList?channelType=1&systemType=2"
        NetworkManager.GET(withUrl: url, paramters: [:], success: {
            (respond : [String : AnyObject]?) in
            let obj = respond?["obj"] as AnyObject
            self.result = obj["result"] as AnyObject
        }){ (error) in
            print(error?.localizedDescription)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: Any) {
        let userName = self.username.text
        let passWord = self.password.text
        let url = "http://116.62.103.139:8080/sjjz/app/user/login?loginName="+(userName!)+"&password="+(passWord!)+"&loginType=1&phoneSerialNumber=1C34D7A6-6248-4167-9010-725BE009A45A&ip=192.168.0.113"
        NetworkManager.GET(withUrl: url, paramters: [:], success: {
            (respond : [String : AnyObject]?) in
            let result = respond?["result"] as! Int
            if(result == 1){
                DispatchQueue.main.async(execute: {
                    self.performSegue(withIdentifier: "home", sender: self)
                })
            }else{
                print("Error Login")
            }
            
        }){ (error) in
            print(error?.localizedDescription)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let destinationView = segue.destination as! ViewController
        
        destinationView.result = self.result
    }
}

