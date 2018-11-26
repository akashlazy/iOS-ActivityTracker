//
//  AddActivityVC.swift
//  Tracker
//
//  Created by lazy on 11/23/18.
//  Copyright © 2018 World. All rights reserved.
//

import UIKit
import Photos
import Foundation

class AddActivityVC: UIViewController{
    
    @IBOutlet weak var mainScrollView: TPKeyboardAvoidingScrollView!
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var imgActivity: UIImageView!
    
    @IBOutlet weak var txtActivityName: MKTextField!
    @IBOutlet weak var txtActivityDiscription: UITextView!
    @IBOutlet weak var lblDiscription: UILabel!
    
    @IBOutlet weak var lblDueDate: UILabel!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    @IBOutlet weak var lblAssign: UILabel!
    @IBOutlet weak var userCollectionView: UICollectionView!
    
    private let cellIdentifier = "UserCell"
    
    private var arrUsers = [ArrUsers]()
    
    var activityID = ""
    var activityName = ""
    var desc = ""
    var dueDate = ""
    var imageName = ""
    
    private var image: UIImage! = nil
    
    private var selectedUserArr = [Int]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        refreshView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "strAddActivity".localized
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(editImage))
        self.editView.addGestureRecognizer(tap)
        
        navigation()
        viewConfiguration()
    }
    
    private func navigation() {
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonClick))
        self.navigationItem.leftBarButtonItem = cancel
        
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonClick))
        self.navigationItem.rightBarButtonItem = done
    }
    
    private func viewConfiguration() {
        
        // Scroll View
        mainScrollView.backgroundColor = CustomColor.lightBackground()
        
        //View
        backView.backgroundColor = UIColor.clear
        
        //ImageView
        if !imageName.isEmpty {
            self.imgActivity.image = loadImage(imageName)
        }
        
        // TextField
        configureTextField(txtActivityName, placeholder: "strActNameHint".localized)
        txtActivityName.delegate = self
        
        if !activityName.isEmpty {
            txtActivityName.text = activityName
        }
        
        //TextView
        configureTextView(txtActivityDiscription, placeholder: "strDespHint".localized)
        txtActivityDiscription.delegate = self
        
        if !desc.isEmpty {
            txtActivityDiscription.text = desc
        }
        
        //Label
        configureLabel(lblAssign)
        configureLabel(lblDueDate)
        configureLabel(lblDiscription)
        
        lblAssign.text = "strAssignUsers".localized
        lblDueDate.text = "strDueDate".localized
        lblDiscription.text = "strDesp".localized
        
        //CollectionView
        userCollectionView.delegate = self
        userCollectionView.dataSource = self
        
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        userCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        
        //Date Picker
        dueDatePicker.minimumDate = Date()
        
        if !dueDate.isEmpty {
            
        }
    }
    
    private func configureTextField(_ textField: MKTextField, placeholder: String) {
        
        textField.placeholder = placeholder
        textField.layer.borderColor = UIColor.clear.cgColor
        textField.floatingPlaceholderEnabled = true
        textField.tintColor = CustomColor.shamrock()
        textField.corRadius = 0
        textField.bottomBorderEnabled = true
        textField.font = UIFont.systemFont(ofSize: 15)
    }
    
    private func configureTextView(_ textView: UITextView, placeholder: String) {
        
        textView.layer.cornerRadius = 3
        textView.layer.borderWidth = 1
        textView.layer.borderColor = CustomColor.grayLight().cgColor
        textView.text = placeholder
        textView.textColor = CustomColor.textGrayColor()
        textView.font = UIFont.systemFont(ofSize: 16)
    }
    
    private func configureLabel(_ label: UILabel) {
        lblAssign.textColor = CustomColor.dark_gray()
        lblDueDate.textColor = CustomColor.dark_gray()
        lblDiscription.textColor = CustomColor.dark_gray()
    }

    
    
    // Navigation Operations
    @objc func cancelButtonClick() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func doneButtonClick() {
        self.addActivity()
        dismiss(animated: true, completion: nil)
    }
    
    private func refreshView() {
        arrUsers = [ArrUsers]()
        arrUsers = ArrUsers.sharedInstance.getAllUsers()
        userCollectionView.reloadData()
    }
    
    func addActivity() {
        
        guard let title = txtActivityName.text else {
            return
        }
        
        guard let desc = txtActivityDiscription.text else {
            return
        }
        
        if title.isEmpty {
            self.view.makeToast("Title is Missing")
        } else if desc.isEmpty || desc.equals("strDespHint".localized) {
            self.view.makeToast("Despriction is Missing")
        } else {
            let dueDate = dueDatePicker.date
            let longDate = ConvertionClass.conDateToLong(dueDate)
            
            let textImage = String().removeSpecialCharsFromString(title)
            
            if image != nil {
                isImageStored(textImage)
            }
            
            if activityID.isEmpty {
                ArrActivity.sharedInstance.createActivity(title, desc: desc, imageName: textImage, dueDate: "\(longDate)")
            } else {
                ArrActivity.sharedInstance.updateActivity(activityID, title: title, desc: desc, imageName: textImage, dueDate: "\(longDate)")
            }
        }
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

extension AddActivityVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return arrUsers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UserCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! UserCell
        
        cell.configureCell(arrUsers, index: indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let user = arrUsers[indexPath.row]
        
        if indexPath.row == arrUsers.count - 1 {
            let addUserVC = AddUserVC(nibName: "AddUserVC", bundle: nil)
            addUserVC.imageName = "\(arrUsers.count - 1)"
            self.navigationController?.pushViewController(addUserVC, animated: true)
        } else {
            let cell = collectionView.cellForItem(at: indexPath) as! UserCell
            
            if cell.imgSelect.isHidden {
                cell.imgSelect.isHidden = false
                ArrAssignUsers.sharedInstance.selectUser(user.userID, activityID: activityID)
            } else {
                cell.imgSelect.isHidden = true
                ArrAssignUsers.sharedInstance.unSelectUser(user.userID, activityID: activityID)
            }
        }
    }
    
}

extension AddActivityVC : UITextFieldDelegate, UITextViewDelegate {
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        txtActivityDiscription.text = ""
        txtActivityDiscription.textColor = CustomColor.textBlackColor()
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if txtActivityDiscription.text.lengthOfBytes(using: String.Encoding.utf8) == 0 {
            txtActivityDiscription.textColor = CustomColor.textGrayColor()
            txtActivityDiscription.text = "feedbackHint".localized
            txtActivityDiscription.resignFirstResponder()
        } else {
            //            feedbackText = txtActivityDiscription.text
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.tintColor = CustomColor.shamrock()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.tintColor = CustomColor.grayLight()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.layer.borderColor = CustomColor.grayLight().cgColor
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.layer.borderColor = CustomColor.shamrock().cgColor
    }
}

extension AddActivityVC {
    @objc func editImage() {
        showOptions()
    }
    
    func showOptions() {
        let optionMenu = UIAlertController(title: nil, message: "strChooseImg".localized, preferredStyle: .actionSheet)
        
        // 2
        let deleteAction = UIAlertAction(title: "strCamera".localized, style: .default) { (a) in
            self.showCamera()
        }
        let saveAction = UIAlertAction(title: "strGallary".localized, style: .default) { (a) in
            self.showPhotoLibrary()
        }
        
        // 3
        let cancelAction = UIAlertAction(title: "strCancel".localized, style: .cancel)
        
        // 4
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        // 5
        self.present(optionMenu, animated: true, completion: nil)
        
    }
}

extension AddActivityVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    func showPhotoLibrary() {
        let photoPickerController = UIImagePickerController()
        photoPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        photoPickerController.allowsEditing = false
        photoPickerController.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        
        
        // Get the current authorization state.
        let status = PHPhotoLibrary.authorizationStatus()
        
        if (status == PHAuthorizationStatus.authorized) {
            // Access has been granted.
            self.present(photoPickerController, animated: true, completion: nil)
        } else if (status == PHAuthorizationStatus.denied) {
            // Access has been denied.
            //            SweetAlert().showAlert("Allow Access", subTitle: "go to setting", style: .warning)
        } else if (status == PHAuthorizationStatus.notDetermined) {
            
            // Access has not been determined.
            PHPhotoLibrary.requestAuthorization({ (newStatus) in
                
                if (newStatus == PHAuthorizationStatus.authorized) {
                    
                }
                    
                else {
                    
                }
            })
        }
            
        else if (status == PHAuthorizationStatus.restricted) {
            // Restricted access - normally won't happen.
        }
    }
    
    private func showCamera() {
        let cameraController = UIImagePickerController()
        cameraController.sourceType = UIImagePickerController.SourceType.camera
        cameraController.allowsEditing = false
        cameraController.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        // Get the current authorization state.
        //Camera
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
            if response {
                //access granted
                
                self.present(cameraController, animated: true, completion: nil)
            } else {
                
            }
        }
    }
    
    // Select Photo from Photo Library
    
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [AnyHashable: Any]!) {
        
        self.image = image
        self.imgActivity.image = image
        
        imagePickerControllerDidCancel(picker)
    }
    
    // Cancel Photo Library
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func isImageStored(_ imageName: String) {
        
        let mainPath = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
        let str = Constant.Folder.mainFolderName + Constant.Folder.folderActivityImage + "\(imageName)" + Constant.ImageExtension.jpeg
        guard let path = mainPath.appendingPathComponent(str) else {
            return
        }
        
        FileManagement.createFolder(Constant.Folder.mainFolderName)
        FileManagement.createFolder(Constant.Folder.mainFolderName + Constant.Folder.folderActivityImage)
        
        
        
        guard let imageData = self.image.jpegData(compressionQuality: 0.01) else {
            return
        }
        
        do {
            try imageData.write(to: path, options: .atomic)
        } catch  {
            return
        }
    }
    
    private func loadImage(_ imageName: String) -> UIImage? {
        
        let mainPath = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
        let str = Constant.Folder.mainFolderName + Constant.Folder.folderActivityImage + "\(imageName)" + Constant.ImageExtension.jpeg
        
        guard let path = mainPath.appendingPathComponent(str) else {
            return UIImage(named: "Logo_1")
        }
        
        guard let image = UIImage(contentsOfFile: path.path) else {
            return UIImage(named: "Logo_1")
        }
        
        return image
    }
    
}
