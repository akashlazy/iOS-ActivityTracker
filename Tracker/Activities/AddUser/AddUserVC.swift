//
//  AddUserVC.swift
//  Tracker
//
//  Created by lazy on 11/23/18.
//  Copyright © 2018 World. All rights reserved.
//

import UIKit
import Photos
import Foundation

class AddUserVC: UIViewController {

    @IBOutlet weak var mainScrollView: TPKeyboardAvoidingScrollView!
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var editView: UIView!
    
    @IBOutlet weak var txtUserName: MKTextField!
    
    private var image: UIImage! = nil
    var imageName = ""
    
    var imagePickedBlock: ((UIImage) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "Add Activity"
        
        navigation()
        viewConfiguration()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(editImage))
        self.editView.addGestureRecognizer(tap)
    }
    
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
    
    private func navigation() {
        
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonClick))
        self.navigationItem.rightBarButtonItem = done
    }
    
    private func viewConfiguration() {
        
        // Scroll View
        mainScrollView.backgroundColor = CustomColor.lightBackground()
        
        //View
        backView.backgroundColor = UIColor.clear
        
        
        // TextField
        configureTextField(txtUserName, placeholder: "Enter Activity Name")
        txtUserName.delegate = self
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

  
    
    // Navigation Operations
    @objc func cancelButtonClick() {
        dismissView()
    }
    
    @objc func doneButtonClick() {
        
        guard let userName = txtUserName.text  else {
            return
        }
        
        if userName.isEmpty {
            self.view.makeToast("User Name is Missing")
        }
        
        let mysharedPref = MySharedPreference()
        
        let counter = mysharedPref.getUserCounter()
        isImageStored("\(counter)")
        ArrUsers.sharedInstance.createUser("\(counter)", imageName: "\(counter)")
        mysharedPref.setUserCounter(counter + 1)
        dismissView()
    }
    
   
    private func dismissView() {
        self.navigationController?.popViewController(animated: true)
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


extension AddUserVC : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.tintColor = CustomColor.shamrock()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.tintColor = CustomColor.grayLight()
    }
}

extension AddUserVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
        self.imgUser.image = image
        
        imagePickerControllerDidCancel(picker)
    }

    // Cancel Photo Library
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func isImageStored(_ imageName: String) {
        
        let mainPath = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
        let str = Constant.Folder.mainFolderName + Constant.Folder.folderUserImage + "\(imageName)" + Constant.ImageExtension.jpeg
        guard let path = mainPath.appendingPathComponent(str) else {
            return
        }
        
        FileManagement.createFolder(Constant.Folder.mainFolderName)
        FileManagement.createFolder(Constant.Folder.mainFolderName + Constant.Folder.folderUserImage)
        guard let imageData = self.image.jpegData(compressionQuality: 0.01) else {
            return
        }
        
        do {
            try imageData.write(to: path, options: .atomic)
        } catch  {
            return
        }
    }
    
}
