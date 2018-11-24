//
//  AddActivityVC.swift
//  Tracker
//
//  Created by lazy on 11/23/18.
//  Copyright © 2018 World. All rights reserved.
//

import UIKit


class AddActivityVC: UIViewController{
    
    @IBOutlet weak var mainScrollView: TPKeyboardAvoidingScrollView!
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var headerView: UIView!
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        refreshView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Add Activity"
        
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
        
        
        // TextField
        configureTextField(txtActivityName, placeholder: "Enter Activity Name")
        txtActivityName.delegate = self
        
        //TextView
        configureTextView(txtActivityDiscription, placeholder: "abc".localized)
        txtActivityDiscription.delegate = self
        
        //Label
        configureLabel(lblAssign)
        configureLabel(lblDueDate)
        configureLabel(lblDiscription)
        
        //CollectionView
        userCollectionView.delegate = self
        userCollectionView.dataSource = self
        
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        userCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        
        //Date Picker
        dueDatePicker.minimumDate = Date()
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
        dismissView()
    }
    
    @objc func doneButtonClick() {
        dismissView()
    }
    
    private func dismissView() {
        dismiss(animated: true, completion: nil)
    }

    
    private func refreshView() {
        arrUsers = ArrUsers.sharedInstance.getAllUsers()
        userCollectionView.reloadData()
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

        if indexPath.row == arrUsers.count - 1 {
            let addUserVC = AddUserVC(nibName: "AddUserVC", bundle: nil)
            self.navigationController?.pushViewController(addUserVC, animated: true)
        } else {
            let cell = collectionView.cellForItem(at: indexPath) as! UserCell
            
            if cell.imgSelect.isHidden {
                cell.imgSelect.isHidden = false
            } else {
                cell.imgSelect.isHidden = true
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
    
    
}
