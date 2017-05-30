import UIKit

//swift遵守协议只需要跟在父类之后，使用逗号隔开
class ViewController: UIViewController {
    var result:AnyObject!
    var adsList:[AnyObject]!
    var adsDetailResult:String!
    
    //1.创建tableView对象
    lazy var tableView : UITableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化UI
        setUpUI()
        
        //请求排重接口
        sendRequest()
    }
    
    override func loadView() {
        super.loadView()
        self.adsList = self.result as! Array<AnyObject>
    }
}

extension ViewController{
    ///初始化UI
    func setUpUI() {
        //2设置tableView的frame
        tableView.frame = view.bounds
        //3.添加到控制器view
        view.addSubview(tableView)
        //4设置数据源
        tableView.dataSource = self
        //5设置代理
        tableView.delegate = self
    }
    
    func sendRequest(){
        let url = "http://116.62.103.139:8080/sjjz/app/duijie/paichong?appid=1&idfa=37AB7354-D5FB-4F9B-AB5C-A76469D58684"
        NetworkManager.GET(withUrl: url, paramters: [:], success: {
            (respond : [String : AnyObject]?) in
            let result = respond?["result"] as! Int
            if(result == 1){
                print("zhengque")
            }else{
                print("cuowu")
                }
            }){ (error) in
                print(error?.localizedDescription)
        }
    }
}


/*
 extension ViewController {} 相当于OC中的类别，可以把一些方法放在里面，不能写属性
 */

// MARK: tableView的数据源和代理的扩展  (这里相当于OC中的 #pragma 书签)
extension ViewController :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.adsList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1创建cell
        let identifier : String = "identifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            //在swift中使用枚举类型方式 1>枚举类型.具体类型  2> .具体类型
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier)
        }
        //2设置数据
        
        cell?.textLabel?.text = adsList[indexPath.row]["adverName"] as? String
        cell?.imageView?.image = UIImage(named: "pic.jpg")
        //3返回cell
        
        return cell!//在这个地方返回的cell一定不为nil，可以强制解包
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.adsDetailResult = "test"
        self.performSegue(withIdentifier: "detail", sender: self)
        
//        let url = "http://116.62.103.139:8080/sjjz/app/duijie/dianji?source=1&appid=1&idfa=37AB7354-D5FB-4F9B-AB5C-A76469D58684"
//        NetworkManager.GET(withUrl: url, paramters: [:], success: {
//            (respond : [String : AnyObject]?) in
//            let result = respond?["result"] as! Int
//            if(result == 1){
//                print("zhengque")
//                self.adsDetailResult = "test"
//                DispatchQueue.main.async(execute: {
//                    self.performSegue(withIdentifier: "detail", sender: self)
//                })
//            }else{
//                print("cuowu")
//                self.adsDetailResult = "test"
//                DispatchQueue.main.async(execute: {
//                    self.performSegue(withIdentifier: "detail", sender: self)
//                })
//            }
//        }){ (error) in
//            print(error?.localizedDescription)
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let destinationView = segue.destination as! DetailViewController
        
        destinationView.result = self.adsDetailResult
    }
}
