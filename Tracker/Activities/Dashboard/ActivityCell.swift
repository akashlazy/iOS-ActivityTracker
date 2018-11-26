
import UIKit

class ActivityCell: UITableViewCell {
    
    @IBOutlet weak var backView: CardView!
    @IBOutlet weak var backStackViewView: UIStackView!
    
    @IBOutlet weak var editView: CardView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var imgUser1: UIImageView!
    @IBOutlet weak var imgUser2: UIImageView!
    @IBOutlet weak var txtDate: UILabel!
    @IBOutlet weak var txtUserCounter: UILabel!
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtSubTitle: UILabel!
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var imgTask: UIImageView!
    @IBOutlet weak var txttaskCounter: UILabel!
    @IBOutlet weak var txtTime: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    
    var toogle: Bool = false
    
    var classRef: AnyObject! = nil
    
    private var arrActivity: Array<ArrActivity>! = nil
    
    private var timer: Timer? = nil
    
    var startTime = ""
    var stopTime = ""
    var logID = ""
    
    private var isStatus = ""
    private var index = 0
    
    private var timeInterval = 0.0
    
    var startDate = Date()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layer.cornerRadius = 10
        
       // backView.backgroundColor = UIColor.green
        
        editView.backgroundColor = CustomColor.shamrock()
        
        imgIcon.layer.cornerRadius = 3
        imgIcon.layer.masksToBounds = true
        
        imgUser1.layer.cornerRadius = imgUser1.frame.height / 2
        imgUser1.layer.masksToBounds = true
        
        imgUser2.layer.cornerRadius = imgUser2.frame.height / 2
        imgUser2.layer.masksToBounds = true
        imgUser2.layer.borderWidth = 1
        imgUser2.layer.borderColor = UIColor.white.cgColor
        
        
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        swipeLeftGesture.direction = .left
        backView.addGestureRecognizer(swipeLeftGesture)
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeRightAction))
        swipeRightGesture.direction = .right
        backView.addGestureRecognizer(swipeRightGesture)
        
//        let b = UITapGestureRecognizer(target: self, action: #selector(abc))
//        self.addGestureRecognizer(b)
//        
//        let c = UITapGestureRecognizer(target: self, action: #selector(abc1))
//        editView.addGestureRecognizer(c)
        
        configuration()
    }
    
    func configuration() {
        imgIcon.image = UIImage(named: "Logo_1")
        
        txtTitle.textColor = CustomColor.darker_gray()
        
        txtSubTitle.textColor = CustomColor.light_gray()
        
        txtDate.textColor = CustomColor.dark_gray()
        
        txttaskCounter.textColor = CustomColor.dark_gray()
        
        txtTime.textColor = CustomColor.darker_gray()
        
        txtUserCounter.textColor = CustomColor.light_gray()
    }
    
    @objc func swipeAction() {
        
        if classRef.isKind(of: MainViewController.self) {
            (classRef as! MainViewController).swipeAction(arrActivity[index].id)
        }
    }
    
    @objc func swipeRightAction() {
        
        if classRef.isKind(of: MainViewController.self) {
            (classRef as! MainViewController).swipeReset()
        }
    }
    
//        if self.backView.frame.origin.x < 40 {
//
//
//        } else {
//
//        }
    
    
    
//    @objc func abc() {
//        UIView.animate(withDuration: 0, animations: {
//            self.backView.frame = CGRect(x: 10, y: self.backView.frame.origin.y, width: self.backView.frame.width, height: self.backView.frame.height)
//        }, completion: nil)
//    }
//
//    @objc func abc1() {
//        UIView.animate(withDuration: 0, animations: {
//            self.backView.frame = CGRect(x: 10, y: self.backView.frame.origin.y, width: self.backView.frame.width, height: self.backView.frame.height)
//        }, completion: nil)
//
//        print("Click")
//    }
    
    
    @IBAction func playButtonClick(_ sender: UIButton) {
        
        let sharedPref = MySharedPreference()
        
        let activity = arrActivity[sender.tag]
        
        let activityID = activity.id
        isStatus = activity.isActivityStop
        
        
//        if isStatus.equals("1") {
//            stopTimer()
//            sharedPref.setActivityID(activity.id)
//            sharedPref.setISStart(false)
//            sharedPref.setIndex(index);
        
            
            if classRef.isKind(of: MainViewController.self) {
                (classRef as! MainViewController).playButtonClick(activityID, isStatus: toogle, startTime: startTime, stopTime: stopTime, logID: activity.logID, currentIndex: sender.tag)
            }
            
//        } else {
//
//            sharedPref.setActivityID(activity.id)
//            sharedPref.setISStart(true)
//            sharedPref.setIndex(index)
//
//
//            startTimer()
//
//            sender.setImage(UIImage(named: "Timer_2"), for: .normal)
//            if classRef.isKind(of: MainViewController.self) {
//                (classRef as! MainViewController).playButtonClick(activityID, isStatus: "1", startTime: startTime, stopTime: stopTime, logID: activity.logID)
//            }
//        }
    }
    
    
    @objc func updateTime() {
        
        self.txtTime.text = timeString(time: timeInterval)
        
        timeInterval += 1
//        let fromDate =
//
//        let calendar = Calendar.current
//        let components = Set<Calendar.Component>([.hour, .minute, .second])
//        let differenceOfDate = calendar.dateComponents(in: components, from: <#T##Date#>)
//
//
//        let hour = differenceOfDate.hour
//        let minutes = differenceOfDate.minute
//        let seconds = differenceOfDate.second
//
//        self.txtTime.text = "\(hour ?? 00):\(minutes ?? 00):\(seconds ?? 00)"
    }

    func startTimer() {
        startTime = "\(ConvertionClass.currentTime())"
        
        guard timer == nil else { return }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        guard timer == nil else { return }
    }
    
    func stopTimer() {
        self.txtTime.text = timeString(time: timeInterval)
        
        stopTime = "\(ConvertionClass.currentTime())"
        guard timer != nil else { return }
        timer?.invalidate()
        timer = nil
    }

    func configureCell(_ arr: [ArrActivity], index: Int, classRef: AnyObject) {
        
        self.classRef = classRef
        arrActivity = arr
        self.index = index
        
        let activity = arr[index]
        btnStart.tag = index
        
        let activityID = activity.id
        startTime = activity.startTime
        stopTime = activity.lastUpdate
        
        logID = activity.logID
        
        if !activity.totalTime.isEmpty {
            timeInterval = Double(activity.totalTime)!
        }
        
            
        self.txtTitle.text = activity.title
        self.txtSubTitle.text = activity.description
        
        if !activity.dueDate.isEmpty {
           self.txtDate.text = ConvertionClass.conLongToDate(Double(activity.dueDate)!, dateFormat: "EEE, dd MMM yyyy")
        }
        
        if activity.totalTask.isEmpty {
            txttaskCounter.isHidden = true
            imgTask.isHidden = true
        } else {
            txttaskCounter.isHidden = false
            txttaskCounter.text = activity.completedTask + "/" + activity.totalTask
            imgTask.isHidden = false
        }
        
        if activity.isActivityStop.equals("1") {
            btnStart.setImage(UIImage(named: "Timer_2"), for: .normal)
            
            startTimer()
        } else {
            btnStart.setImage(UIImage(named: "Timer_1"), for: .normal)
            self.updateTime()
        }
        
        if !activity.userImageName.isEmpty {
            let arrImages = activity.userImageName.split(",")
            
            switch arrImages.count {
            case 1:
                imgUser1.isHidden = false
                imgUser1.image = loadImage(arrImages[0])
                
                imgUser2.isHidden = true
                txtUserCounter.isHidden = true
            case 2:
                imgUser1.isHidden = false
                imgUser2.isHidden = false
                imgUser1.image = loadImage(arrImages[0])
                imgUser2.image = loadImage(arrImages[1])
                txtUserCounter.isHidden = true
            default:
                imgUser1.isHidden = false
                imgUser2.isHidden = false
                
                imgUser1.image = loadImage(arrImages[0])
                imgUser2.image = loadImage(arrImages[1])
                
                let counter = arrImages.count - 2
                
                if counter > 0 {
                    txtUserCounter.isHidden = false
                    txtUserCounter.text = "+\(counter)"
                }
            }
        
        } else {
            imgUser1.isHidden = true
            imgUser2.isHidden = true
            txtUserCounter.isHidden = true
        }
        
        if activity.imageName.isEmpty {
            self.imgIcon.image = UIImage(named: "Logo_1")
        } else {
            self.imgIcon.image = loadActivityImage(activity.imageName)
        }
        
        if activity.isSwipe.equals("1") {
            self.backView.frame = CGRect(x: -100, y: self.backView.frame.origin.y, width: self.backView.frame.width, height: self.backView.frame.height)
            
//            UIView.animate(withDuration: 0, animations: {
//                
//            }, completion: nil)
        } else {
//            UIView.animate(withDuration: 0, animations: {
                self.backView.frame = CGRect(x: 10, y: self.backView.frame.origin.y, width: self.backView.frame.width, height: self.backView.frame.height)
//            }, completion: nil)
        }
    }
    
    func loadActivityImage(_ getImage: String) -> UIImage? {
        
        let mainPath = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
        let str = Constant.Folder.mainFolderName + Constant.Folder.folderActivityImage + "\(getImage)" + Constant.ImageExtension.jpeg
        guard let path = mainPath.appendingPathComponent(str) else {
            return UIImage(named: "Logo_1")
        }

        let image = UIImage(contentsOfFile: path.path)
        
        if image == nil {
            return UIImage(named: "Logo_1")
        }
        return image
    }
    
    func loadImage(_ getImage: String) -> UIImage? {
        let mainPath = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
        let str = Constant.Folder.mainFolderName + Constant.Folder.folderUserImage + "\(getImage)" + Constant.ImageExtension.jpeg
        guard let path = mainPath.appendingPathComponent(str) else {
            return UIImage(named: "Member_1")
        }
        
        let image = UIImage(contentsOfFile: path.path)
        
        if image == nil {
            return UIImage(named: "Member_1")
        }
        return image
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension ActivityCell {
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}
