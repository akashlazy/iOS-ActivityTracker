
import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var hideView: UIView!
    @IBOutlet weak var hideLabel: UILabel!
    
    private var arrActivity = [ArrActivity]()
    
    private var isSwipe = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        self.refreshList()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        self.title = "strActivities".localized
        
        self.view.backgroundColor = CustomColor.background()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClick))
        self.navigationItem.rightBarButtonItem = add
        
        hideLabel.textColor = CustomColor.dark_gray()
        hideLabel.text = "strNoActivity".localized
    }
    
    
    @objc func addButtonClick() {
        let addActivity = AddActivityVC(nibName: "AddActivityVC", bundle: nil)
        let nav = UINavigationController(rootViewController: addActivity)
        self.present(nav, animated: true, completion: nil)
    }
    
    func refreshList() {
        
        arrActivity = [ArrActivity]()
        arrActivity = ArrActivity.sharedInstance.getAllActivity()
        
        if arrActivity.isEmpty {
            tableView.isHidden = true
            hideView.isHidden = false
        } else {
            tableView.isHidden = false
            hideView.isHidden = true
            
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrActivity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ActivityCell! = tableView.dequeueReusableCell(withIdentifier: "ActivityCell") as? ActivityCell
        
        if cell == nil {
            tableView.register(UINib(nibName: "ActivityCell", bundle: nil), forCellReuseIdentifier: "ActivityCell")
            cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell") as? ActivityCell
        }
        
        cell.configureCell(arrActivity, index: indexPath.row, classRef: self)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let activity = arrActivity[indexPath.row]
        
        if activity.isSwipe.equals("1") {
            
            let addActivity = AddActivityVC(nibName: "AddActivityVC", bundle: nil)
            let nav = UINavigationController(rootViewController: addActivity)

            addActivity.activityID = activity.id
            addActivity.activityName = activity.title
            addActivity.imageName = activity.imageName
            
            self.present(nav, animated: true, completion: nil)
        } else {
            let checklistVC = ChecklistVC(nibName: "ChecklistVC", bundle: nil)
    
            checklistVC.activityID = activity.id
            checklistVC.activityName = activity.title
            
            self.navigationController?.pushViewController(checklistVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension MainViewController {
    func playButtonClick(_ activityID: String, isStatus: Bool, startTime: String, stopTime: String, logID: String, currentIndex: Int) {

        let appPref = MySharedPreference()
        if appPref.getISStart() == true && !activityID.equals(appPref.getActivityID()) {
            let indexPath = IndexPath(row: appPref.getIndex(), section: 0)
            let cell = tableView.cellForRow(at: indexPath) as? ActivityCell
            
            cell?.toogle = false
            cell?.stopTimer()
            cell?.btnStart.setImage(UIImage(named: "Timer_1"))
            
            ArrActivity.sharedInstance.stopActivity(appPref.getActivityID(), stopTime: cell!.stopTime, logID: cell!.logID)
        }
        
        if !isStatus {
            
            let indexPath = IndexPath(row: currentIndex, section: 0)
            let cell = tableView.cellForRow(at: indexPath) as? ActivityCell
            
            cell?.toogle = true
            cell?.btnStart.setImage(UIImage(named: "Timer_2"))

            appPref.setIndex(currentIndex)
            appPref.setISStart(true)
            appPref.setActivityID(activityID)
            
            cell?.startTimer()
            cell?.logID =
             ArrActivity.sharedInstance.startActivity(activityID, isStatus: "1", startTime: cell!.startTime)
        } else {
            
            appPref.setIndex(currentIndex)
            appPref.setISStart(false)
            appPref.setActivityID(activityID)
            
            let indexPath = IndexPath(row: currentIndex, section: 0)
            let cell = tableView.cellForRow(at: indexPath) as? ActivityCell
            
            cell?.stopTimer()
            cell?.toogle = false
            
            cell?.btnStart.setImage(UIImage(named: "Timer_1"))
            
            ArrActivity.sharedInstance.stopActivity(activityID, stopTime: cell!.stopTime, logID: cell!.logID)
        }
    }
    
    
    func handelSwipe(_ swipeID: String ,isSwipe: Bool, currentIndex: Int) {
        
        let appPref = MySharedPreference()
        
        if appPref.getISSwipe() {
            let indexPath = IndexPath(row: appPref.getIndex(), section: 0)
            let cell = tableView.cellForRow(at: indexPath) as? ActivityCell
            cell?.isSwipe = false
            appPref.setISSwipe(false)
            cell?.swipeOff()
        }
        
        if isSwipe {
            let indexPath = IndexPath(row: currentIndex, section: 0)
            let cell = tableView.cellForRow(at: indexPath) as? ActivityCell

            cell?.isSwipe = false

            appPref.setSwipeIndex(currentIndex)
            appPref.setSwipeID(swipeID)
            appPref.setISSwipe(false)

            cell?.swipeOff()
        } else {
            appPref.setSwipeIndex(currentIndex)
            appPref.setSwipeID(swipeID)
            appPref.setISSwipe(true)

            let indexPath = IndexPath(row: currentIndex, section: 0)
            let cell = tableView.cellForRow(at: indexPath) as? ActivityCell

            cell?.swipeOn()
            cell?.isSwipe = true
        }
    }
}
