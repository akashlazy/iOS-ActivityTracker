
import UIKit

class MySharedPreference: NSObject {
    var objCommon = UserDefaults()

    override init() {
        super.init()
        
        objCommon = UserDefaults.standard
    }
    
    // User case
    func getUserCase() -> String! {
        if objCommon.string(forKey: "UserCase") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "UserCase")
        }
    }
    
    func setUserCase(_ text: String!) {
        objCommon.set(text, forKey: "UserCase")
        objCommon.synchronize()
    }
    
    // Get MobileDeviceTocken
    func getMobileDeviceToken() -> String! {
        if objCommon.string(forKey: "MobileDeviceToken") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "MobileDeviceToken")
        }
    }
    func setMobileDeviceToken(_ text: String!) {
        objCommon.set(text, forKey: "MobileDeviceToken")
        objCommon.synchronize()
    }
    
    func getIsServerToken() -> Bool {
        return objCommon.bool(forKey: "IsServerToken")
    }
    func setIsServerToken(_ text: Bool) {
        objCommon.set(text, forKey: "IsServerToken")
        objCommon.synchronize()
    }
    
     // Get MobileModel
    func getMobileModel() -> String! {
        if objCommon.string(forKey: "MobileModel") == nil {
           return ""
        } else {
            return objCommon.string(forKey: "MobileModel")
        }
    }
    func setMobileModel(_ text: String!) {
        objCommon.set(text, forKey: "MobileModel")
        objCommon.synchronize()
    }
    
    // Get Version of Application
    func getAppCurrentVersionCode() -> String! {
        if objCommon.string(forKey: "VersionCode") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "VersionCode")
        }
    }
    func setAppCurrentVersionCode(_ text: String!) {
        objCommon.set(text, forKey: "VersionCode")
        objCommon.synchronize()
    }
    
    // Get Long Version of Application
    func getAppCurrentVersionCodeLong() -> String! {
        if objCommon.string(forKey: "VersionCodeLong") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "VersionCodeLong")
        }
    }
    func setAppCurrentVersionCodeLong(_ text: String!) {
        objCommon.set(text, forKey: "VersionCodeLong")
        objCommon.synchronize()
    }
    
    // Get Version of Application
    func getServerCurrentVersionName() -> String! {
        if objCommon.string(forKey: "ServerCurrentVersionName") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "ServerCurrentVersionName")
        }
    }
    func setServerCurrentVersionName(_ text: String!) {
        objCommon.set(text, forKey: "ServerCurrentVersionName")
        objCommon.synchronize()
    }
    
    // Get Version of Application
    func getMobileCurrentVersionCode() -> String! {
        if objCommon.string(forKey: "MobileCurrentVersionCode") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "MobileCurrentVersionCode")
        }
    }
    func setMobileCurrentVersionCode(_ text: String!) {
        objCommon.set(text, forKey: "MobileCurrentVersionCode")
        objCommon.synchronize()
    }
    
    // Get Application ID
    func getApplicationID() -> String! {
        if objCommon.string(forKey: "ApplicationID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "ApplicationID")
        }
    }
    func setApplicationID(_ text: String!) {
        objCommon.set(text, forKey: "ApplicationID")
        objCommon.synchronize()
    }
    
    func getIsNewDeviceID() -> String! {
        if objCommon.string(forKey: "IsNewDeviceID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "IsNewDeviceID")
        }
    }
    func setIsNewDeviceID(_ text: String!) {
        objCommon.set(text, forKey: "IsNewDeviceID")
        objCommon.synchronize()
    }
    
    // Server Version of Application
    func getServerCurrentVersionCode() -> Int {
        return objCommon.integer(forKey: "ServerVersionCode")
    }
    func setServerCurrentVersionCode(_ text: Int) {
        objCommon.set(text, forKey: "ServerVersionCode")
        objCommon.synchronize()
    }
    
    // Last date of update version change
    func getLastDateVersionCodeChange() -> String! {
        if objCommon.string(forKey: "LastDateVersionCodeChange") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "LastDateVersionCodeChange")
        }
    }
    
    // Last time of Licence Check call
    func getLastTimeLicenceCheckCall() -> Double {
        return objCommon.double(forKey: "LastTimeLicenceCheckCall")
    }
    func setLastTimeLicenceCheckCall(_ time: Double) {
        objCommon.set(time, forKey: "LastTimeLicenceCheckCall")
        objCommon.synchronize()
    }
    
    func setLastDateVersionCodeChange(_ text: String!) {
        objCommon.set(text, forKey: "LastDateVersionCodeChange")
        objCommon.synchronize()
    }
    
    // IS Discalamer accept
    func getISAppDisclamerAccepted() -> Bool {
        return objCommon.bool(forKey: "ISAppDisclamerAccepted")
    }
    func setISAppDisclamerAccepted(_ text: Bool) {
        objCommon.set(text, forKey: "ISAppDisclamerAccepted")
        objCommon.synchronize()
    }
    
    // is App Running
    func getISAppRunning() -> Bool {
        return objCommon.bool(forKey: "ISAppRunning")
    }
    func setISAppRunning(_ text: Bool) {
        objCommon.set(text, forKey: "ISAppRunning")
        objCommon.synchronize()
    }
    
    // is IS App Gyroscope Enable
    func getISAppGyroscopeEnable() -> Bool {
        return objCommon.bool(forKey: "ISAppGyroscopeEnable")
    }
    func setISAppGyroscopeEnable(_ text: Bool) {
        objCommon.set(text, forKey: "ISAppGyroscopeEnable")
        objCommon.synchronize()
    }
  
    
    //Open Side Panel On Dashboard
    func getIsOpenSidePanelDashboard() -> Bool {
        return objCommon.bool(forKey: "IsOpenSidePanelDashboard")
    }
    func setIsOpenSidePanelDashboard(_ text: Bool) {
        objCommon.set(text, forKey: "IsOpenSidePanelDashboard")
        objCommon.synchronize()
    }
    
    //Last side index of dashboard
    func getLastSideIndexDashboard() -> Int{
        return objCommon.integer(forKey: "LastSideIndexDashboard")
    }
    func setLastSideIndexDashboard(_ text: Int) {
        objCommon.set(text, forKey: "LastSideIndexDashboard")
        objCommon.synchronize()
    }
    
    //User HTTP Response code
    func getHttpResponseCode() -> Int! {
        return objCommon.integer(forKey: "HttpResponseCode")
    }
    func setHttpResponseCode(_ text: Int!) {
        objCommon.set(text, forKey: "HttpResponseCode")
        objCommon.synchronize()
    }
    //User HTTP Response Message
    func getHttpResponseMessage() -> String! {
        if objCommon.string(forKey: "HttpResponseMessage") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "HttpResponseMessage")
        }
    }
    func setHttpResponseMessage(_ text: String!) {
        objCommon.set(text, forKey: "HttpResponseMessage")
        objCommon.synchronize()
    }
    //User HTTP Getting data
    func getISGettingData() -> Bool{
        return objCommon.bool(forKey: "ISGettingData")
    }
    func setISGettingData(_ text: Bool) {
        objCommon.set(text, forKey: "ISGettingData")
        objCommon.synchronize()
    }
    
    
    // //////////// Database parameter
    // ISDatabaseWriteMode
    func getISDatabaseWriteMode() -> Bool {
        return objCommon.bool(forKey: "ISDatabaseWriteMode")
    }
    func setISDatabaseWriteMode(_ text: Bool) {
        objCommon.set(text, forKey: "ISDatabaseWriteMode")
        objCommon.synchronize()
    }
    
    func getISDBOperationCreated() -> Bool {
        return objCommon.bool(forKey: "ISDBOperationCreated")
    }
    func setISDBOperationCreated(_ text: Bool) {
        objCommon.set(text, forKey: "ISDBOperationCreated")
        objCommon.synchronize()
    }
    
    func getISDBTrackerCreated() -> Bool {
        return objCommon.bool(forKey: "ISDBTrackerCreated")
    }
    func setISDBTrackerCreated(_ text: Bool) {
        objCommon.set(text, forKey: "ISDBTrackerCreated")
        objCommon.synchronize()
    }
    
    func getISDBTrackerReportCreated() -> Bool {
        return objCommon.bool(forKey: "ISDBTrackerReportCreated")
    }
    func setISDBTrackerReportCreated(_ text: Bool) {
        objCommon.set(text, forKey: "ISDBTrackerReportCreated")
        objCommon.synchronize()
    }
    
    // need to update database
    func getNeedUpdateDatabase() -> Bool {
        return objCommon.bool(forKey: "NeedUpdateDatabase")
    }
    func setNeedUpdateDatabase(_ text: Bool) {
        objCommon.set(text, forKey: "NeedUpdateDatabase")
        objCommon.synchronize()
    }
    
    // previous version of database
    func getPreviousDBVersion() -> Int {
        return objCommon.integer(forKey: "PreviousDBVersion")
    }
    func setPreviousDBVersion(_ text: Int) {
        objCommon.set(text, forKey: "PreviousDBVersion")
        objCommon.synchronize()
    }
    // ////////////End Database parameter
    
    
    ///////////// Generral parameter
    // KeyboardHeight
    func getKeyboardHeight() -> Int {
        return objCommon.integer(forKey: "KeyboardHeight")
    }
    func setKeyboardHeight(_ text: Int) {
        objCommon.set(text, forKey: "KeyboardHeight")
        objCommon.synchronize()
    }
    //XMPP Registration Done
    func getXMPPRegistrationDone() -> Bool {
        return objCommon.bool(forKey: "XMPPRegistrationDone")
    }
    func setXMPPRegistrationDonetext(_ text: Bool) {
        objCommon.set(text, forKey: "XMPPRegistrationDone")
        objCommon.synchronize()
    }
    
    // method for Xmpp Msg Pending
    func getIsXmppMsgPending() -> Bool {
        return objCommon.bool(forKey: "IsXmppMsgPending")
    }
    func setIsXmppMsgPending(_ text: Bool) {
        objCommon.set(text, forKey: "IsXmppMsgPending")
        objCommon.synchronize()
    }
    
    // Last Periodic check condition time
    func getLastPeriodicCondCheckTime() -> Double {
        return objCommon.double(forKey: "LastPeriodicCondCheckTime")
    }
    func setLastPeriodicCondCheckTime(_ time: Double) {
        objCommon.set(time, forKey: "LastPeriodicCondCheckTime")
        objCommon.synchronize()
    }
    // Last Periodic Report check condition time
    func getLastReportPeriodicCondCheckTime() -> Double {
        return objCommon.double(forKey: "LastReportPeriodicCondCheckTime")
    }
    func setLastReportPeriodicCondCheckTime(_ time: Double) {
        objCommon.set(time, forKey: "LastReportPeriodicCondCheckTime")
        objCommon.synchronize()
    }
    
    ///////////////////end general parameter
    
    
    // /////////User Information
    //Mobile ID of user
    func getMobileID() -> String! {
        if objCommon.string(forKey: "MobileID") == nil {
            return ""
        }  else {
            return objCommon.string(forKey: "MobileID")
        }
    }
    func setMobileID(_ text: String!) {
        objCommon.set(text, forKey: "MobileID")
        objCommon.synchronize()
    }
    //Device ID of user
    func getDeviceID() -> String! {
        if objCommon.string(forKey: "DeviceID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DeviceID")
        }
    }
    func setDeviceID(_ text: String!) {
        objCommon.set(text, forKey: "DeviceID")
        objCommon.synchronize()
    }
    
    //is User Login Expire
    func getIsUserLoginExpire() -> Bool {
        return objCommon.bool(forKey: "IsUserLoginExpire")
    }
    
    func setIsUserLoginExpire(_ text: Bool) {
        objCommon.set(text, forKey: "IsUserLoginExpire")
        objCommon.synchronize()
    }
    
    //Mobile number of user
    func getMobileNo() -> String! {
        if objCommon.string(forKey: "MobileNo") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "MobileNo")
        }
    }
    func setMobileNo(_ text: String!) {
        objCommon.set(text, forKey: "MobileNo")
        objCommon.synchronize()
    }
    
    func getTempMobileDeviceID() -> String! {
        if objCommon.string(forKey: "TempPhoneDeviceID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "TempPhoneDeviceID")
        }
    }
    func setTempMobileDeviceID(_ text: String!) {
        objCommon.set(text, forKey: "TempPhoneDeviceID")
        objCommon.synchronize()
    }
    
    //Server Device ID of user
    func getServerPhoneDeviceID() -> String! {
        if objCommon.string(forKey: "ServerPhoneDeviceID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "ServerPhoneDeviceID")
        }
    }
    func setServerPhoneDeviceID(_ text: String!) {
        objCommon.set(text, forKey: "ServerPhoneDeviceID")
        objCommon.synchronize()
    }    
    
    //FirstName of user
    func getFirstName() -> String! {
        if objCommon.string(forKey: "FirstName") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "FirstName")
        }
    }
    func setFirstName(_ text: String!) {
        objCommon.set(text, forKey: "FirstName")
        objCommon.synchronize()
    }
    //LastName of user
    func getLastName() -> String! {
        if objCommon.string(forKey: "LastName") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "LastName")
        }
    }
    func setLastName(_ text: String!) {
        objCommon.set(text, forKey: "LastName")
        objCommon.synchronize()
    }
    
    //Email of user
    func getEmail() -> String! {
        if objCommon.string(forKey: "Email") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "Email")
        }
    }
    func setEmail(_ text: String!) {
        objCommon.set(text, forKey: "Email")
        objCommon.synchronize()
    }
    
    //City Name of user
    func getCityName() -> String! {
        if objCommon.string(forKey: "CityName") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "CityName")
        }
    }
    func setCityName(_ text: String!) {
        objCommon.set(text, forKey: "CityName")
        objCommon.synchronize()
    }
    
    //Gender of user
    func getGender() -> String! {
        if objCommon.string(forKey: "Gender") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "Gender")
        }
    }
    func setGender(_ text: String!) {
        objCommon.set(text, forKey: "Gender")
        objCommon.synchronize()
    }
    
    //App Reg Lat
    func getAppRegLatitude() -> String! {
        return objCommon.string(forKey: "AppRegLatitude")
    }
    func setAppRegLatitude(_ text: String!) {
        objCommon.set(text, forKey: "AppRegLatitude")
        objCommon.synchronize()
    }
    
    //App Reg Longitude
    func getAppRegLongitude() -> String! {
        return objCommon.string(forKey: "AppRegLongitude")
    }
    func setAppRegLongitude(_ text: String!) {
        objCommon.set(text, forKey: "AppRegLongitude")
        objCommon.synchronize()
    }
    
    //App Reg City Name
    func getAppRegiCityName() -> String! {
        return objCommon.string(forKey: "AppRegiCityName")
    }
    func setAppRegiCityName(_ text: String!) {
        objCommon.set(text, forKey: "AppRegiCityName")
        objCommon.synchronize()
    }
    
    //DOB of user
    func getDOB() -> Double {
        return objCommon.double(forKey: "DOB")
    }
    func setDOB(text: Double) {
        objCommon.set(text, forKey: "DOB")
        objCommon.synchronize()
    }
    
    //Current photo camera action
    func getSelectPhotoOption() -> String! {
        if objCommon.string(forKey: "SelectPhotoOption") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "SelectPhotoOption")
        }
    }
    func setSelectPhotoOption(_ ID: String!) {
        objCommon.set(ID, forKey: "SelectPhotoOption")
        objCommon.synchronize()
    }
    //Is Profile Photo change
    func getIsProfilePhotoChange() -> Bool {
        return objCommon.bool(forKey: "IsProfilePhotoChange")
    }
    func setIsProfilePhotoChange(_ ID: Bool) {
        objCommon.set(ID, forKey: "IsProfilePhotoChange")
        objCommon.synchronize()
    }
    
    //Verification mobile number
    // phone verification code
    func getVerificationCode() -> Int {
        return objCommon.integer(forKey: "VerificationCode")
    }
    func setVerificationCode(_ text: Int) {
        objCommon.set(text, forKey: "VerificationCode")
        objCommon.synchronize()
    }
    
    // SMS Come verification code
    func getVerificationSMSComeCode() -> String! {
        if objCommon.string(forKey: "VerificationSMSComeCode") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "VerificationSMSComeCode")
        }
    }
    func setVerificationSMSComeCode(_ text: String) {
        objCommon.set(text, forKey: "VerificationSMSComeCode")
        objCommon.synchronize()
    }
    
    //phone verification  Act Open
    func getISPhoneVeriActOpen() -> Bool {
        return objCommon.bool(forKey: "ISPhoneVeriActOpen")
    }
    func setISPhoneVeriActOpen(_ ID: Bool) {
        objCommon.set(ID, forKey: "ISPhoneVeriActOpen")
        objCommon.synchronize()
    }

    //Country Code
    func getMobileCountryCode() -> String! {
        if objCommon.string(forKey: "MobileCountryCode") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "MobileCountryCode")
        }
    }
    func setMobileCountryCode(_ text: String!) {
  		objCommon.set(text, forKey: "MobileCountryCode")
  		objCommon.synchronize()
    }
    
    //Country Code Integer
    func getMobileCountryCodeNumber() -> String! {
        if objCommon.string(forKey: "MobileCountryCodeNumber") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "MobileCountryCodeNumber")
        }
    }
    func setMobileCountryCodeNumber(_ text: String!) {
        objCommon.set(text, forKey: "MobileCountryCodeNumber")
        objCommon.synchronize()
    }
    
    // //////end User Info
    
    // ////////////chat options
    // method for Chat user name
    func setChatUserName(_ isMessageOn: String!) {
        objCommon.set(isMessageOn, forKey: "ChatUserName")
        objCommon.synchronize()
    }
    func getChatUserName() -> String! {
        if objCommon.string(forKey: "ChatUserName") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "ChatUserName")
        }
    }
    
    // method for Chat mobileNum
    func setChatMobileNum(_ isMessageOn: String!) {
        objCommon.set(isMessageOn, forKey: "ChatMobileNum")
        objCommon.synchronize()
    }
    func getChatMobileNum() -> String! {
        if objCommon.string(forKey: "ChatMobileNum") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "ChatMobileNum")
        }
    }
    
    // method for Chat Current mobileNum
    func setChatCurrentMobileNum(_ isMessageOn: String!) {
        objCommon.set(isMessageOn, forKey: "ChatCurrentMobileNum")
        objCommon.synchronize()
    }
    func getChatCurrentMobileNum() -> String! {
        if objCommon.string(forKey: "ChatCurrentMobileNum") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "ChatCurrentMobileNum")
        }
    }
    
    // method for Chat message pending
    func setTotalChatMsgPending(_ isMessageOn: Int) {
        objCommon.set(isMessageOn, forKey: "TotalChatMsgPending")
        objCommon.synchronize()
    }
    func getTotalChatMsgPending() -> Int {
        return objCommon.integer(forKey: "TotalChatMsgPending")
    }
    
    /*
    // method for Chat Unread Counter
    func setTotalUnreadChatJson(JSONArray msgUnread) {
   
    objCommon.putString("TotalUnreadChatJson", msgUnread.toString());
    objCommon.synchronize()
    }
    func JSONArray getTotalUnreadChatJson() {
    try {
    return new JSONArray(objCommon.getString("TotalUnreadChatJson", "[]"));
    } catch (JSONException e) {}
    
    return null;
    }
    */

    // method for Chat CurrStatus
    func setChatCurrStatus(_ isMessageOn: String!) {
        objCommon.set(isMessageOn, forKey: "CurrStatus")
        objCommon.synchronize()
    }
    func getChatCurrStatus() -> String! {
        if objCommon.string(forKey: "CurrStatus") == nil || objCommon.string(forKey: "CurrStatus") == "" {
            return "Hey there! I am using RigV."
        } else {
            return objCommon.string(forKey: "CurrStatus")
        }
    }
    
    //last GPS Loc Getting Time
    func getLastGPSLocGetTime() -> Double {
        return objCommon.double(forKey: "LastGPSLocGetTime")
    }
    func setLastGPSLocGetTime(_ time: Double) {
        objCommon.set(time, forKey: "LastGPSLocGetTime")
        objCommon.synchronize()
    }
    
    // method for Dashboard NearestFrnd
    func setDashboardNearFrndJson(_ msgUnread: AnyObject!) {
        objCommon.set(msgUnread, forKey: "DashboardNearFrndJson")
        objCommon.synchronize()
    }
    func getDashboardNearFrndJson() -> AnyObject! {
        return objCommon.object(forKey: "DashboardNearFrndJson") as AnyObject
    }
    
    // method for Dashboard Nearest Devices
    func setDashboardNearDevicesJson(_ msgUnread: AnyObject!) {
        objCommon.set(msgUnread, forKey: "DashboardNearDevicesJson")
        objCommon.synchronize()
    }
    func getDashboardNearDevicesJson() -> AnyObject! {
        return objCommon.object(forKey: "DashboardNearDevicesJson") as AnyObject
    }
    
    // method for request getting user data
    func setGetUserLocData(_ isMessageOn: String!) {
        objCommon.set(isMessageOn, forKey: "GetUserLocData")
        objCommon.synchronize()
    }
    func getGetUserLocData() -> String! {
        if objCommon.string(forKey: "GetUserLocData") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "GetUserLocData")!
        }
    }
    
    // method for Request Visible status
    func setLocRequestVisibleStatus(_ isMessageOn: String) {
        objCommon.set(isMessageOn, forKey: "LocRequestVisibleStatus")
        objCommon.synchronize()
    }
    func getLocRequestVisibleStatus() -> String {
        if objCommon.string(forKey: "LocRequestVisibleStatus") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "LocRequestVisibleStatus")!
        }
    }
    //////////////end chat
    
    //////////// Phonebook My people list
    // Phonebook Last Counter
    func getPhonebookLastCounter() -> Int {
        return objCommon.integer(forKey: "PhonebookLastCounter")
    }
    func setPhonebookLastCounter(_ text: Int) {
        objCommon.set(text, forKey: "PhonebookLastCounter")
        objCommon.synchronize()
    }
    // Phonebook Status code
    func getPhonebookStatusCode() -> String {
        if objCommon.string(forKey: "PhonebookStatusCode") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "PhonebookStatusCode")!
        }
    }
    func setPhonebookStatusCode(_ text: String) {
        objCommon.set(text, forKey: "PhonebookStatusCode")
        objCommon.synchronize()
    }
    // Phonebook Total Sync Counter
    func getPhonebookTotalSyncCounter() -> Int {
        return objCommon.integer(forKey: "PhonebookTotalSyncCounter")
    }
    func setPhonebookTotalSyncCounter(_ text: Int) {
        objCommon.set(text, forKey: "PhonebookTotalSyncCounter")
        objCommon.synchronize()
    }
    
    // Phonebook Total Avail Counter
    func getPhonebookTotalAvailCounter() -> Int {
        return objCommon.integer(forKey: "PhonebookTotalAvailCounter")
    }
    func setPhonebookTotalAvailCounter(_ text: Int) {
        objCommon.set(text, forKey: "PhonebookTotalAvailCounter")
        objCommon.synchronize()
    }
    //////////////end phoonbook my people list
    
    
    /////---- GPS Info -----
    //Is getting weather activity open
    func getIsGPSPermission() -> Bool {
        return objCommon.bool(forKey: "IsGPSPermission")
    }
    func setIsGPSPermission(_ text: Bool) {
        objCommon.set(text, forKey: "IsGPSPermission")
        objCommon.synchronize()
    }
    
    func getIsGPSScanning() -> Bool {
        return objCommon.bool(forKey: "IsGPSScanning")
    }
    func setIsGPSScanning(_ text: Bool) {
        objCommon.set(text, forKey: "IsGPSScanning")
        objCommon.synchronize()
    }
    //Is getting Network Scanning
    func getIsNetworkScanning() -> Bool {
        return objCommon.bool(forKey: "IsNetworkScanning")
    }
    func setIsNetworkScanning(_ text: Bool) {
        objCommon.set(text, forKey: "IsNetworkScanning")
        objCommon.synchronize()
    }
    //Temp Latitude
    func getTempLatitude() -> Double {
        return objCommon.double(forKey: "TempLatitude")
    }
    func setTempLatitude(_ GcmID: Double) {
        objCommon.set(GcmID, forKey: "TempLatitude")
        objCommon.synchronize()
    }
    //Temp Longitude
    func getTempLongitude() -> Double {
        return objCommon.double(forKey: "TempLongitude")
    }
    func setTempLongitude(_ GcmID: Double) {
        objCommon.set(GcmID, forKey: "TempLongitude")
        objCommon.synchronize()
    }
    //Temp GPS Accuracy
    func getTempAccuracy() -> String {
        if objCommon.string(forKey: "TempAccuracy") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "TempAccuracy")!
        }
    }
    func setTempAccuracy(_ Accuracy: String) {
        objCommon.set(Accuracy, forKey: "TempAccuracy")
        objCommon.synchronize()
    }
    //Temp location Provider
    func getTempLocationProvider() -> String {
        if objCommon.string(forKey: "TempLocationProvider") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "TempLocationProvider")!
        }
    }
    func setTempLocationProvider(_ Accuracy: String) {
        objCommon.set(Accuracy, forKey: "TempLocationProvider")
        objCommon.synchronize()
    }
    
    //For set default altiude
    func getDefAltitude() -> String {
        if objCommon.string(forKey: "DefAltitude") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DefAltitude")!
        }
    }
    func setDefAltitude(_ alti: String) {
        objCommon.set(alti, forKey: "DefAltitude")
        objCommon.synchronize()
    }
    
    //For set share location time
    func getShareLocationTime() -> String {
        if objCommon.string(forKey: "ShareLocationTime") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "ShareLocationTime")!
        }
    }
    func setShareLocationTime(_ text: String) {
        objCommon.set(text, forKey: "ShareLocationTime")
        objCommon.synchronize()
    }
    ////////////////////GPS Info
    
    /////////////Data Import export
    //For set last back up time
    func getLastBackupTime() -> String {
        if objCommon.string(forKey: "LastBackupTime") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "LastBackupTime")!
        }
    }    
    func setLastBackupTime(_ text: String) {
        objCommon.set(text, forKey: "LastBackupTime")
        objCommon.synchronize()
    }
    //Is need to Backup previous data
    func getIsNeedBackupPreData() -> Bool {
        return objCommon.bool(forKey: "IsNeedBackupPreData")
    }    
    func setIsNeedBackupPreData(_ text: Bool) {
        objCommon.set(text, forKey: "IsNeedBackupPreData")
        objCommon.synchronize()
    }
    ////////////////////Data Import export
        
    //////////////////////////Network usage
    //For set last back up time
    func getLastResetTimeNetworkUsage() -> String {
        if objCommon.string(forKey: "ResetTimeNetworkUsage") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "ResetTimeNetworkUsage")!
        }
    }
    func setLastResetTimeNetworkUsage(_ text: String) {
        objCommon.set(text, forKey: "ResetTimeNetworkUsage")
        objCommon.synchronize()
    }
    
    func getTotalBytesSent() -> Double {
        return objCommon.double(forKey: "TotalBytesSent")
    }
    func setTotalBytesSent(_ text: Double) {
        objCommon.set(text, forKey: "TotalBytesSent")
        objCommon.synchronize()
    }
    
    func getTotalBytesReceived() -> Double {
        return objCommon.double(forKey: "TotalBytesReceived")
    }
    func setTotalBytesReceived(_ text: Double) {
        objCommon.set(text, forKey: "TotalBytesReceived")
        objCommon.synchronize()
    }
    //////////////////////////////////////////
    
    //Document wallet
    func getDocWalletKey() -> Int {
        return objCommon.integer(forKey: "DocWalletKey")
    }
    func setDocWalletKey(_ text: Int) {
        objCommon.set(text, forKey: "DocWalletKey")
        objCommon.synchronize()
    }
    ///End Document wallet
    
    ////Temp preference for the doc wallet folder
    //////////////////////////////////////////////
    func getTempDocWalletFolderCreate() -> Bool {
        return objCommon.bool(forKey: "TempDocWalletFolderCreate")
    }
    func setTempDocWalletFolderCreate(_ text: Bool) {
        objCommon.set(text, forKey: "TempDocWalletFolderCreate")
        objCommon.synchronize()
    }
    ////////////////////////////////////////
    
    ////////////Dealer Information
    //Dealer Current Postion
    func getDealerCurrentPosition() -> Int {
        return objCommon.integer(forKey: "DealerCurrentPosition")
    }
    func setDealerCurrentPosition(_ text: Int) {
        objCommon.set(text, forKey: "DealerCurrentPosition")
        objCommon.synchronize()
    }
    
    //Dealer last GPS Scan Time
    func getDealerLastGPSScanTime() -> Double {
        return objCommon.double(forKey: "DealerLastGPSScanTime")
    }
    func setDealerLastGPSScanTime(_ text: Double) {
        objCommon.set(text, forKey: "DealerLastGPSScanTime")
        objCommon.synchronize()
    }
    
    //Dealer last Get record Time
    func getDealerLastGetRecordTime() -> Double {
        return objCommon.double(forKey: "DealerLastGetRecordTime")
    }
    func setDealerLastGetRecordTime(_ text: Double) {
        objCommon.set(text, forKey: "DealerLastGetRecordTime")
        objCommon.synchronize()
    }
    ////////////Dealer Info End
    
    ///////////Build Application
    //Build application done or not
    func getIsNeedBuildRigvApp() -> Bool {
        return objCommon.bool(forKey: "IsNeedBuildRigvApp")
    }
    func setIsNeedBuildRigvApp(_ text: Bool) {
        objCommon.set(text, forKey: "IsNeedBuildRigvApp")
        objCommon.synchronize()
    }
    ///////////////end Build App
    
    ///////////Feedback and suggestion
    //User feedback Message
    func getUserFeedbackMsg() -> String {
        if objCommon.string(forKey: "UserFeedbackMsg") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "UserFeedbackMsg")!
        }
    }
    func setUserFeedbackMsg(_ ID: String) {
        objCommon.set(ID, forKey: "UserFeedbackMsg")
        objCommon.synchronize()
    }
    ////////////////end feedback and suggestion
    
    ///////////Address book mng
    //Current Address
    func getCurrentAddress() -> String {
        if objCommon.string(forKey: "CurrentAddress") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "CurrentAddress")!
        }
    }
    func setCurrentAddress(_ ID: String) {
        objCommon.set(ID, forKey: "CurrentAddress")
        objCommon.synchronize()
    }
    
    //Network Last Update Time
    func getNetworkLastUpdateTime() -> Double {
        return objCommon.double(forKey: "NetworkLastUpdateTime")
    }
    func setNetworkLastUpdateTime(_ ID: Double) {
        objCommon.set(ID, forKey: "NetworkLastUpdateTime")
        objCommon.synchronize()
    }
    
    //Is Tracker Details show, true
    func getIsTrackerDetailsShow() -> Bool {
        return objCommon.bool(forKey: "IsTrackerDetailsShow")
    }
    func setIsTrackerDetailsShow(_ ID: Bool) {
        objCommon.set(ID, forKey: "IsTrackerDetailsShow")
        objCommon.synchronize()
    }
    //Is Tracker Indicator, true
    func getIsTrackerIndicator() -> Bool {
        return objCommon.bool(forKey: "IsTrackerIndicator")
    }
    func setIsTrackerIndicator(_ ID: Bool) {
        objCommon.set(ID, forKey: "IsTrackerIndicator")
        objCommon.synchronize()
    }
    //Is Chat Indicator, true
    func getIsChatIndicator() -> Bool {
        return objCommon.bool(forKey: "IsChatIndicator")
    }
    func setIsChatIndicator(_ ID: Bool) {
        objCommon.set(ID, forKey: "IsChatIndicator")
        objCommon.synchronize()
    }
        
    
    //Is Tracker Sort by Ignition ON
    func getIsTrackerSortIngnition() -> Bool {
        return objCommon.bool(forKey: "IsTrackerSortIngnition")
    }
    func setIsTrackerSortIngnition(_ ID: Bool) {
        objCommon.set(ID, forKey: "IsTrackerSortIngnition")
        objCommon.synchronize()
    }
    
    //Is Sync on cloud
    func getIsAddBkSyncCloud() -> Bool {
        return objCommon.bool(forKey: "IsAddBkSyncCloud")
    }
    func setIsAddBkSyncCloud(_ ID: Bool) {
        objCommon.set(ID, forKey: "IsAddBkSyncCloud")
        objCommon.synchronize()
    }
    
    // Address Is Verified
    func setIsOnlyVerifiedAddress(_ text: Bool) {
        objCommon.set(text, forKey: "IsOnlyVerifiedAddress")
        objCommon.synchronize()
    }
    func getIsOnlyVerifiedAddress() -> Bool {
        return objCommon.bool(forKey: "IsOnlyVerifiedAddress")
    }
    
    //Is Pending Sync on Clound
    func setIsPendingAddBkSyncCloud(_ ID: Bool) {
        objCommon.set(ID, forKey: "IsPendingAddBkSyncCloud")
        objCommon.synchronize()
    }
    func getIsPendingAddBkSyncCloud() -> Bool {
        return objCommon.bool(forKey: "IsPendingAddBkSyncCloud")
    }
    
    //Is Pending Delete pending ID
    func getIsPendingAddBkDelete() -> String {
        if objCommon.string(forKey: "IsPendingAddBkDelete") == nil {
            self.setIsPendingAddBkDelete("")
            return ""
        } else {
            return objCommon.string(forKey: "IsPendingAddBkDelete")!
        }
    }
    func setIsPendingAddBkDelete(_ ID: String) {
        objCommon.set(ID, forKey: "IsPendingAddBkDelete")
        objCommon.synchronize()
    }
    
    //Is Pending Delete pending ID
    func getIsPendingAddBkRestoreDelete() -> String {
        if objCommon.string(forKey: "IsPendingAddBkRestoreDelete") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "IsPendingAddBkRestoreDelete")!
        }
    }
    func setIsPendingAddBkRestoreDelete(_ ID: String) {
        objCommon.set(ID, forKey: "IsPendingAddBkRestoreDelete")
        objCommon.synchronize()
    }
    
    //Is Pending Delete Group pending ID
    func getIsPendingAddBkDeleteGroup() -> String {
        if objCommon.string(forKey: "IsPendingAddBkDeleteGroup") == nil {
            self.setIsPendingAddBkDeleteGroup("")
            return ""
        } else {
            return objCommon.string(forKey: "IsPendingAddBkDeleteGroup")!
        }
    }
    func setIsPendingAddBkDeleteGroup(_ ID: String) {
        objCommon.set(ID, forKey: "IsPendingAddBkDeleteGroup")
        objCommon.synchronize()
    }
  
    //Is Pending Delete pending ID
    func getIsPendingAddBkRestoreDeleteGroup() -> String {
        if objCommon.string(forKey: "IsPendingAddBkRestoreDeleteGroup") == nil {
            self.setIsPendingAddBkRestoreDeleteGroup("")
            return ""
        } else {
            return objCommon.string(forKey: "IsPendingAddBkRestoreDeleteGroup")!
        }
    }
    func setIsPendingAddBkRestoreDeleteGroup(_ ID: String) {
        objCommon.set(ID, forKey: "IsPendingAddBkRestoreDeleteGroup")
        objCommon.synchronize()
    }
    
    //Is Pending Address process ID
    func getIsPendingAddBkProcessID() -> String {
        if objCommon.string(forKey: "IsPendingAddBkProcessID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "IsPendingAddBkProcessID")!
        }
    }
    func setIsPendingAddBkProcessID(_ ID: String) {
        objCommon.set(ID, forKey: "IsPendingAddBkProcessID")
        objCommon.synchronize()
    }
    
    //Is Global Avail
    func getIsGlobalAvail() -> String {
        if objCommon.string(forKey: "IsGlobalAvail") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "IsGlobalAvail")!
        }
    }
    func setIsGlobalAvail(_ ID: String) {
        objCommon.set(ID, forKey: "IsGlobalAvail")
        objCommon.synchronize()
    }
    
    //Is Pending Global pending ID
    func getIsPendingAddBkGlobal() -> String {
        if objCommon.string(forKey: "IsPendingAddBkGlobal") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "IsPendingAddBkGlobal")!
        }
    }
    func setIsPendingAddBkGlobal(_ ID: String) {
        objCommon.set(ID, forKey: "IsPendingAddBkGlobal")
        objCommon.synchronize()
    }
    
    //Is Pending Global pending ID
    func getGlobalCatIDList() -> String {
        if objCommon.string(forKey: "GlobalCatIDList") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "GlobalCatIDList")!
        }
    }
    func setGlobalCatIDList(_ ID: String) {
        objCommon.set(ID, forKey: "GlobalCatIDList")
        objCommon.synchronize()
    }
    
    //Make Global address id
    func getMakeGlobalAddrID() -> String! {
        if objCommon.string(forKey: "MakeGlobalAddrID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "MakeGlobalAddrID")!
        }
    }
    func setMakeGlobalAddrID(_ ID: String!) {
        objCommon.set(ID, forKey: "MakeGlobalAddrID")
        objCommon.synchronize()
    }
    
    //Is Pending Non Global pending ID
    func getIsPendingAddBkNonGlobal() -> String {
        if objCommon.string(forKey: "IsPendingAddBkNonGlobal") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "IsPendingAddBkNonGlobal")!
        }
    }
    func setIsPendingAddBkNonGlobal(_ ID: String) {
        objCommon.set(ID, forKey: "IsPendingAddBkNonGlobal")
        objCommon.synchronize()
    }
    
    //Is Pending Fevorite pending ID
    func getIsPendingAddBkFevorite() -> String {
        if objCommon.string(forKey: "IsPendingAddBkFevorite") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "IsPendingAddBkFevorite")!
        }
    }
    func setIsPendingAddBkFevorite(_ ID: String) {
        objCommon.set(ID, forKey: "IsPendingAddBkFevorite")
        objCommon.synchronize()
    }
    
    //Is Pending Non Global pending ID
    func getIsPendingAddBkNonFevorite() -> String {
        if objCommon.string(forKey: "IsPendingAddBkNonFevorite") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "IsPendingAddBkNonFevorite")!
        }
    }
    func setIsPendingAddBkNonFevorite(_ ID: String) {
        objCommon.set(ID, forKey: "IsPendingAddBkNonFevorite")
        objCommon.synchronize()
    }
    
    //Total Global Counter
    func setTotalGlobalCounter(_ text: Int) {
        objCommon.set(text, forKey: "TotalGlobalCounter")
        objCommon.synchronize()
    }
    func getTotalGlobalCounter() -> Int {
        return objCommon.integer(forKey: "TotalGlobalCounter")
    }
    
    //Search Request Type
    func setAddrSearchReqType(_ text: String!) {
        objCommon.set(text, forKey: "AddrSearchReqType")
        objCommon.synchronize()
    }
    func getAddrSearchReqType() -> String! {
        if objCommon.string(forKey: "AddrSearchReqType") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "AddrSearchReqType")
        }
    }
    
    //Search Request Text
    func setAddrSearchReqText(_ text: String!) {
        objCommon.set(text, forKey: "AddrSearchReqText")
        objCommon.synchronize()
    }
    func getAddrSearchReqText() -> String! {
        if objCommon.string(forKey: "AddrSearchReqText") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "AddrSearchReqText")
        }
    }
    
    // Get Device Last DateTime list
    func setDeviceLastDateTimeList(_ text: String!) {
        objCommon.set(text, forKey: "DeviceLastDateTimeList")
        objCommon.synchronize()
    }
    func getDeviceLastDateTimeList() -> String! {
        if objCommon.string(forKey: "DeviceLastDateTimeList") != nil {
            return objCommon.string(forKey: "DeviceLastDateTimeList")
        } else {
            return ""
        }
    }
    
    // Get Device Last DateTime list
    func setDeviceTypeList(_ text: String!) {
        objCommon.set(text, forKey: "DeviceTypeList")
        objCommon.synchronize()
    }
    func getDeviceTypeList() -> String! {
        if objCommon.string(forKey: "DeviceTypeList") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DeviceTypeList")
        }
    }
    
    // Get Device Active list
    func setDeviceActiveList(_ text: String!) {
        objCommon.set(text, forKey: "DeviceActiveList")
        objCommon.synchronize()
    }
    func getDeviceActiveList() -> String! {
        if objCommon.string(forKey: "DeviceActiveList") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DeviceActiveList")!
        }
    }
    
    // Get Device Search Temp list
    func setDeviceSearchTemp(_ text: String!) {
        objCommon.set(text, forKey: "DeviceSearchTemp")
        objCommon.synchronize()
    }
    func getDeviceSearchTempList() -> String! {
        if objCommon.string(forKey: "DeviceSearchTemp") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DeviceSearchTemp")!
        }
    }
    
    //Search Request Position
    func setAddrSearchReqPosition(_ text: Int) {
        objCommon.set(text, forKey: "AddrSearchReqPosition")
        objCommon.synchronize()
    }
    func getAddrSearchReqPosition() -> Int {
        return objCommon.integer(forKey: "AddrSearchReqPosition")
    }
    
    //Is Pending Rename Group name Array
    func setIsPendingAddBkRenameGrp(_ ID: NSMutableArray) {
        objCommon.set(ID, forKey: "IsPendingAddBkRenameGrp")
        objCommon.synchronize()
    }
    func getIsPendingAddBkRenameGrp() -> NSMutableArray {
        if objCommon.object(forKey: "IsPendingAddBkRenameGrp") == nil {
            return NSMutableArray()
        }
        
        return objCommon.object(forKey: "IsPendingAddBkRenameGrp") as! NSMutableArray
    }
    ////////////////end feedback and suggestion
    
    
    ///////GPS SySTEM Control panel
    // Is GPS Driving mode On
    func setIsGPSDrivingModeOn(_ text: Bool) {
        objCommon.set(text, forKey: "IsGPSDrivingModeOn")
        objCommon.synchronize()
    }
    func getIsGPSDrivingModeOn() -> Bool {
        return objCommon.bool(forKey: "IsGPSDrivingModeOn")
    }
    
    // Is Manage battery mode On
    func setIsManagebatteryModeOn(_ text: Bool) {
        objCommon.set(text, forKey: "IsManagebatteryModeOn")
        objCommon.synchronize()
    }
    func getIsManagebatteryModeOn() -> Bool {
        return objCommon.bool(forKey: "IsManagebatteryModeOn")
    }
    
    // GPS Scanning mode Type
    func setGPSScanningModeType(_ text: Int) {
        objCommon.set(text, forKey: "GPSScanningModeType")
        objCommon.synchronize()
    }
    func getGPSScanningModeType() -> Int {
        return objCommon.integer(forKey: "GPSScanningModeType")
    }
    
    // Manage battery Level
    func setManageBatteryLevel(_ text: Int) {
        objCommon.set(text, forKey: "ManageBatteryLevel")
        objCommon.synchronize()
    }
    func getManageBatteryLevel() -> Int {
        return objCommon.integer(forKey: "ManageBatteryLevel")
    }
    /////ENd GPS SYstem control panelFf
    
    ////////Device Setting
    // Set minimum fuel alert
    func setMiniFuelAlert(_ text: Int) {
        objCommon.set(text, forKey: "MiniFuelAlert")
        objCommon.synchronize()
    }
    func getMiniFuelAlert() -> Int {
        return objCommon.integer(forKey: "MiniFuelAlert")
    }
    
    // Set maximum fuel alert
    func setMaxFuelAlert(_ text: Int) {
        objCommon.set(text, forKey: "MaxFuelAlert")
        objCommon.synchronize()
    }
    func getMaxFuelAlert() -> Int {
        return objCommon.integer(forKey: "MaxFuelAlert")
    }
    
    // Set oil alert
    func setOilChngAlert(_ text: Int) {
        objCommon.set(text, forKey: "OilChngAlert")
        objCommon.synchronize()
    }
    func getOilChngAlert() -> Int {
        return objCommon.integer(forKey: "OilChngAlert")
    }
    
    // Set insure alert
    func setInsureChngAlert(_ text: Int) {
        objCommon.set(text, forKey: "InsureChngAlert")
        objCommon.synchronize()
    }
    func getInsureChngAlert() -> Int {
        return objCommon.integer(forKey: "InsureChngAlert")
    }
    
    // Get Server Last Time
    func getServerLastTime() -> Double {
        return objCommon.double(forKey: "ServerLastTime")
    }
    func setServerLastTime(_ text: Double) {
        objCommon.set(text, forKey: "ServerLastTime")
        objCommon.synchronize()
    }
    
    // Get DeviceID list
    func setDeviceIDList(_ text: String!) {
        objCommon.set(text, forKey: "DeviceIDList")
        objCommon.synchronize()
    }
    func getDeviceIDList() -> String! {
        if objCommon.string(forKey: "DeviceIDList") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DeviceIDList")
        }
    }
    
    // Get Report DeviceID
    func setReportDeviceID(_ text: String!) {
        objCommon.set(text, forKey: "ReportDeviceID")
        objCommon.synchronize()
    }
    func getReportDeviceID() -> String! {
        if objCommon.string(forKey: "ReportDeviceID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "ReportDeviceID")
        }
    }
    
    // Get AutoReport DeviceID
    func setAutoReportDeviceID(_ text: String) {
        objCommon.set(text, forKey: "AutoReportDeviceID")
        objCommon.synchronize()
    }
    func getAutoReportDeviceID() -> String! {
        if objCommon.string(forKey: "AutoReportDeviceID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "AutoReportDeviceID")
        }
    }
    
    // Get Report Gen Window Running
    func setReportGenWindowRun(_ text: Bool) {
        objCommon.set(text, forKey: "ReportGenWindowRun")
        objCommon.synchronize()
    }
    func getReportGenWindowRun() -> Bool {
        return objCommon.bool(forKey: "ReportGenWindowRun")
    }
    
    // Get SecureMode DeviceID
    func setSecureModeDeviceID(_ text: String!) {
        objCommon.set(text, forKey: "SecureModeDeviceID")
        objCommon.synchronize()
    }
    func getSecureModeDeviceID() -> String! {
        if objCommon.string(forKey: "SecureModeDeviceID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "SecureModeDeviceID")
        }
    }
    
    // Get SecureMode DeviceName
    func setSecureModeDeviceName(_ text: String!) {
        objCommon.set(text, forKey: "SecureModeDeviceName")
        objCommon.synchronize()
    }
    func getSecureModeDeviceName() -> String! {
        if objCommon.string(forKey: "SecureModeDeviceName") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "SecureModeDeviceName")
        }
    }
    
    // Get SecureMode GeoDistance
    func setSecureModeGeoDistance(_ text: String!) {
        objCommon.set(text, forKey: "SecureModeGeoDistance")
        objCommon.synchronize()
    }
    func getSecureModeGeoDistance() -> String! {
        if objCommon.string(forKey: "SecureModeGeoDistance") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "SecureModeGeoDistance")
        }
    }
    
    // Get AntiTheft DeviceID
    func setAntiTheftModeDeviceID(_ text: String!) {
        objCommon.set(text, forKey: "AntiTheftModeDeviceID")
        objCommon.synchronize()
    }
    func getAntiTheftModeDeviceID() -> String! {
        if objCommon.string(forKey: "AntiTheftModeDeviceID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "AntiTheftModeDeviceID")
        }
    }
    
    // Get AntiTheft DeviceName
    func setAntiTheftModeDeviceName(_ text: String!) {
        objCommon.set(text, forKey: "AntiTheftModeDeviceName")
        objCommon.synchronize()
    }
    func getAntiTheftModeDeviceName() -> String! {
        if objCommon.string(forKey: "AntiTheftModeDeviceName") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "AntiTheftModeDeviceName")
        }
    }
    
    // Get AntiTheft GeoDistance
    func setAntiTheftModeGeoDistance(_ text: String!) {
        objCommon.set(text, forKey: "AntiTheftModeGeoDistance")
        objCommon.synchronize()
    }
    func getAntiTheftModeGeoDistance() -> String! {
        if objCommon.string(forKey: "AntiTheftModeGeoDistance") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "AntiTheftModeGeoDistance")
        }
    }

    // Get AntiTheft ServerID
    func setAntiTheftModeServerID(_ text: String!) {
        objCommon.set(text, forKey: "AntiTheftModeServerID")
        objCommon.synchronize()
    }
    func getAntiTheftModeServerID() -> String! {
        if objCommon.string(forKey: "AntiTheftModeServerID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "AntiTheftModeServerID")
        }
    }
    
    // Get Temp AntiTheft Distance
    func setTempAntiTheftModeDistance(_ text: String!) {
        objCommon.set(text, forKey: "TempAntiTheftModeDistance")
        objCommon.synchronize()
    }
    func getTempAntiTheftModeDistance() -> String! {
        if objCommon.string(forKey: "TempAntiTheftModeDistance") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "TempAntiTheftModeDistance")
        }
    }

    // Get Temp AntiTheft Lat,Lng
    func setTempAntiTheftModeLatLng(_ text: String!) {
        objCommon.set(text, forKey: "TempAntiTheftModeLatLng")
        objCommon.synchronize()
    }
    func getTempAntiTheftModeLatLng() -> String! {
        if objCommon.string(forKey: "TempAntiTheftModeLatLng") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "TempAntiTheftModeLatLng")
        }
    }
    
    // Get SecureMode Request Type
    func setSecureModeRequestType(_ text: String!) {
        objCommon.set(text, forKey: "SecureModeRequestType")
        objCommon.synchronize()
    }
    func getSecureModeRequestType() -> String! {
        if objCommon.string(forKey: "SecureModeRequestType") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "SecureModeRequestType")
        }
    }
    
    // method for Device Record From Time
    func setDeviceReportDateTime(_ text: String!) {
        objCommon.set(text, forKey: "DeviceReportDateTime")
        objCommon.synchronize()
    }
    func getDeviceReportDateTime() -> String! {
        if objCommon.string(forKey: "DeviceReportDateTime") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DeviceReportDateTime")
        }
    }
    
    // method for Device Record From Time
    func setDeviceIDFromTimeJson(_ ID: NSMutableArray!) {
        objCommon.set(ID, forKey: "DeviceIDFromTimeJson")
        objCommon.synchronize()
    }
    func getDeviceIDFromTimeJson() -> NSMutableArray! {
        if objCommon.object(forKey: "DeviceIDFromTimeJson") != nil {
            return NSMutableArray(array: objCommon.array(forKey: "DeviceIDFromTimeJson")!)
        } else {
            return NSMutableArray()
        }
    }
    
    // method for Device Record Process Time
    func setDeviceIDProcessTimeJson(_ msgUnread: NSMutableArray!) {
        objCommon.set(msgUnread, forKey: "DeviceIDProcessTimeJson")
        objCommon.synchronize()
    }
    func getDeviceIDProcessTimeJson() -> NSMutableArray! {
        if objCommon.object(forKey: "DeviceIDProcessTimeJson") != nil {
            return NSMutableArray(array: objCommon.array(forKey: "DeviceIDProcessTimeJson")!)
        } else {
            return NSMutableArray()
        }
    }
    
    func setDeviceReportBackupIsPregress(_ text: Bool) {
        objCommon.set(text, forKey: "DeviceReportBackupIsPregress")
        objCommon.synchronize()
    }
    func getDeviceReportBackupIsPregress() -> Bool {
        return objCommon.bool(forKey: "DeviceReportBackupIsPregress")
    }
    
    // Get Report Server From DateTime
    func setDeviceServerReportFromTime(_ text: String!) {
        objCommon.set(text, forKey: "DeviceServerReportFromTime")
        objCommon.synchronize()
    }
    func getDeviceServerReportFromTime() -> String! {
        if objCommon.string(forKey: "DeviceServerReportFromTime") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DeviceServerReportFromTime")
        }
    }
    
    // Get Report Server to DateTime
    
    func setDeviceServerReportToTime(_ text: String!) {
        objCommon.set(text, forKey: "DeviceServerReportToTime")
        objCommon.synchronize()
    }
    func getDeviceServerReportToTime() -> String! {
        if objCommon.string(forKey: "DeviceServerReportToTime") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DeviceServerReportToTime")!
        }
    }
    
    // Get Report Server ProcessDone DateTime
    func setDeviceServerReportProcessDoneTime(_ text: String!) {
        objCommon.set(text, forKey: "DeviceSrvrReportPrssTm")
        objCommon.synchronize()
    }
    func getDeviceServerReportProcessDoneTime() -> String! {
        if objCommon.string(forKey: "DeviceSrvrReportPrssTm") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DeviceSrvrReportPrssTm")!
        }
    }
    
    // Get Report Server ProcessDone DateTime
    func setDeviceServerReportCounter(_ text: Int) {
        objCommon.set(text, forKey: "DeviceServerReportCounter")
        objCommon.synchronize()
    }
    func getDeviceServerReportCounter() -> Int {
        return objCommon.integer(forKey: "DeviceServerReportCounter")
    }
    
    ///////////// End Device Setting
    
    ///Guide window set reste preference
    func setIsGuideClosed(_ text: Bool) {
        objCommon.set(text, forKey: "IsGuideClosed")
        objCommon.synchronize()
    }
    func getIsGuideClosed() -> Bool {
        return objCommon.bool(forKey: "IsGuideClosed")
    }
    
    func setIsStartGuideDone(_ text: Bool) {
        objCommon.set(text, forKey: "IsStartGuideDone")
        objCommon.synchronize()
    }
    func getIsStartGuideDone() -> Bool {
        return objCommon.bool(forKey: "IsStartGuideDone")
    }
    
    func setIsGuideClicked(_ text: Bool) {
        objCommon.set(text, forKey: "IsGuideClicked")
        objCommon.synchronize()
    }
    func getIsGuideClicked() -> Bool {
        return objCommon.bool(forKey: "IsGuideClicked")
    }
    
    ////////// Follow Me
    func getGPSLocSendStartTime() -> Double {
        return objCommon.double(forKey: "GPSLocSendStartTime")
    }
    func setGPSLocSendStartTime(_ text: Double) {
        objCommon.set(text, forKey: "GPSLocSendStartTime")
        objCommon.synchronize()
    }
    
    func getGPSLocSendStopTime() -> Double {
        return objCommon.double(forKey: "GPSLocSendStopTime")
    }
    func setGPSLocSendStopTime(_ text: Double) {
        objCommon.set(text, forKey: "GPSLocSendStopTime")
        objCommon.synchronize()
    }
    
    func setRequestFollowMeID(_ text: String!) {
        objCommon.set(text, forKey: "RequestFollowMeID")
        objCommon.synchronize()
    }
    func getRequestFollowMeID() -> String! {
        if objCommon.string(forKey: "RequestFollowMeID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "RequestFollowMeID")
        }
    }
    
    func getRequestFollowMePacketID() -> String {
        if objCommon.string(forKey: "RequestFollowMePacketID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "RequestFollowMePacketID")!
        }
    }
    func setRequestFollowMePacketID(_ text: String) {
        objCommon.setValue(text, forKey: "RequestFollowMePacketID")
        objCommon.synchronize()
    }
    
    func getRequestFollowMeExtMsg() -> String {
        if objCommon.string(forKey: "RequestFollowMeExtMsg") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "RequestFollowMeExtMsg")!
        }
    }
    func setRequestFollowMeExtMsg(_ text: String) {
        objCommon.setValue(text, forKey: "RequestFollowMeExtMsg")
        objCommon.synchronize()
    }
    ///////////// End Follow Me
    
    ///////////My Path
    func setMyPathStartTime(_ text: String!) {
        objCommon.set(text, forKey: "MyPathStartTime")
        objCommon.synchronize()
    }
    func getMyPathStartTime() -> String! {
        if objCommon.string(forKey: "MyPathStartTime") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "MyPathStartTime")
        }
    }
    
    func setMyPathCurrentID(_ text: String!) {
        objCommon.set(text, forKey: "MyPathCurrentID")
        objCommon.synchronize()
    }
    func getMyPathCurrentID() -> String! {
        if objCommon.string(forKey: "MyPathCurrentID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "MyPathCurrentID")
        }
    }
    
    func setMyPathNameCount(_ text: Int) {
        objCommon.set(text, forKey: "MyPathNameCount")
        objCommon.synchronize()
    }
    func getMyPathNameCount() -> Int {
        return objCommon.integer(forKey: "MyPathNameCount")
    }
    /////////End My Path
    
    func getMyPathOldLatitude() -> Double {
        return objCommon.double(forKey: "MyPathOldLatitude")
    }
    func setMyPathOldLatitude(_ text: Double) {
        objCommon.set(text, forKey: "MyPathOldLatitude")
        objCommon.synchronize()
    }
    func getMyPathOldLongitude() -> Double {
        return objCommon.double(forKey: "MyPathOldLongitude")
    }
    func setMyPathOldLongitude(_ text: Double) {
        objCommon.set(text, forKey: "MyPathOldLongitude")
        objCommon.synchronize()
    }
    /////////End My Path
    
    // Set the recent address limit
    func getRecentAddrLimit() -> Int {
        return objCommon.integer(forKey: "RecentAddrLimit")
    }
    func setRecentAddrLimit(_ text: Int) {
        objCommon.set(text, forKey: "RecentAddrLimit")
        objCommon.synchronize()
    }
    /////////////////////////////////
    
    // Set the speed limit
    func getSpeedLimit() -> Int {
        return objCommon.integer(forKey: "SpeedLimit")
    }
    func setSpeedLimit(_ text: Int) {
        objCommon.set(text, forKey: "SpeedLimit")
        objCommon.synchronize()
    }
    
    func getSettingDeviceID() -> String {
        if objCommon.string(forKey: "SettingDeviceID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "SettingDeviceID")!
        }
    }
    func setSettingDeviceID(_ text: String) {
        objCommon.setValue(text, forKey: "SettingDeviceID")
        objCommon.synchronize()
    }
    
    func getSettingReqType() -> String {
        if objCommon.string(forKey: "SettingReqType") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "SettingReqType")!
        }
    }
    func setSettingReqType(_ text: String) {
        objCommon.setValue(text, forKey: "SettingReqType")
        objCommon.synchronize()
    }
    
    func setTrackerNickAsDisplay(_ text: Bool) {
        objCommon.set(text, forKey: "TrackerNickAsDisplay")
        objCommon.synchronize()
    }
    func getTrackerNickAsDisplay() -> Bool {
        return objCommon.bool(forKey: "TrackerNickAsDisplay")
    }
    
    //Speed alert on or off
    func getSpeedAlertOnOff() -> String! {
        if objCommon.string(forKey: "SpeedAlertOnOff") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "SpeedAlertOnOff")!
        }
    }
    func setSpeedAlertOnOff(_ text: String!) {
        objCommon.setValue(text, forKey: "SpeedAlertOnOff")
        objCommon.synchronize()
    }
    
    //Stoppage alert on or off
    func getStoppageAlertOnOff() -> String {
        if objCommon.string(forKey: "StoppageAlertOnOff") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "StoppageAlertOnOff")!
        }
    }
    func setStoppageAlertOnOff(_ text: String) {
        objCommon.setValue(text, forKey: "StoppageAlertOnOff")
        objCommon.synchronize()
    }
    
    func getStoppageLimit() -> Int {
        return objCommon.integer(forKey: "StoppageLimit")
    }
    func setStoppageLimit(_ text: Int) {
        objCommon.set(text, forKey: "StoppageLimit")
        objCommon.synchronize()
    }

    ///////////////////////
    
    //Ignition alert on or off
    func getIgnitionAlertOn() -> String {
        if objCommon.string(forKey: "IgnitionAlertOn") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "IgnitionAlertOn")!
        }
    }
    func setIgnitionAlertOn(_ text: String) {
        objCommon.setValue(text, forKey: "IgnitionAlertOn")
        objCommon.synchronize()
    }
    
    func getIgnitionAlertOff() -> String {
        if objCommon.string(forKey: "IgnitionAlertOff") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "IgnitionAlertOff")!
        }
    }
    func setIgnitionAlertOff(_ text: String) {
        objCommon.setValue(text, forKey: "IgnitionAlertOff")
        objCommon.synchronize()
    }
    /////////////////
    
    //AC alert on or off
    func getACAlertOn() -> String {
        if objCommon.string(forKey: "ACAlertOn") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "ACAlertOn")!
        }
    }
    func setACAlertOn(_ text: String) {
        objCommon.setValue(text, forKey: "ACAlertOn")
        objCommon.synchronize()
    }
    
    func getACAlertOff() -> String {
        if objCommon.string(forKey: "ACAlertOff") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "ACAlertOff")!
        }
    }
    func setACAlertOff(_ text: String) {
        objCommon.setValue(text, forKey: "ACAlertOff")
        objCommon.synchronize()
    }
    /////////////////
    
    //document wallet upload data
    func getDocUploadData() -> String {
        if objCommon.string(forKey: "DocUploadData") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DocUploadData")!
        }
    }
    func setDocUploadData(_ text: String) {
        objCommon.setValue(text, forKey: "DocUploadData")
        objCommon.synchronize()
    }
    /////////////////////////////
    
    ///Tyre Age Limit
    func getTyreLifeLimit() -> Int {
        return objCommon.integer(forKey: "TyreLifeLimit")
    }
    func setTyreLifeLimit(_ text: Int) {
        objCommon.set(text, forKey: "TyreLifeLimit")
        objCommon.synchronize()
    }
    ///////////////////////
    
    //document wallet upload data
    func getDocUploadServerID() -> String {
        if objCommon.string(forKey: "DocUploadServerID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DocUploadServerID")!
        }
    }
    func setDocUploadServerID(_ text: String) {
        objCommon.setValue(text, forKey: "DocUploadServerID")
        objCommon.synchronize()
    }
    
    // method for request getting Share ID
    func getShareDeleteID() -> String {
        if objCommon.string(forKey: "ShareDeleteID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "ShareDeleteID")!
        }
    }
    func setShareDeleteID(_ text: String) {
        objCommon.setValue(text, forKey: "ShareDeleteID")
        objCommon.synchronize()
    }
    
    // method for request getting Share Mobile Num
    func getShareMobileNumFrd() -> String {
        if objCommon.string(forKey: "ShareMobileNumFrd") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "ShareMobileNumFrd")!
        }
    }
    func setShareMobileNumFrd(_ text: String) {
        objCommon.setValue(text, forKey: "ShareMobileNumFrd")
        objCommon.synchronize()
    }
    
    // method for request getting Device Share ID
    func getShareDeviceDeleteID() -> String {
        if objCommon.string(forKey: "ShareDeviceDeleteID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "ShareDeviceDeleteID")!
        }
    }
    func setShareDeviceDeleteID(_ text: String) {
        objCommon.setValue(text, forKey: "ShareDeviceDeleteID")
        objCommon.synchronize()
    }
    
    // method for notification multiple
    func getStoreMultipleNoti() -> String {
        if objCommon.string(forKey: "SetMultipleNoti") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "SetMultipleNoti")!
        }
    }
    func setStoreMultipleNoti(_ text: String) {
        objCommon.setValue(text, forKey: "SetMultipleNoti")
        objCommon.synchronize()
    }
    
    // method for notification Check Flag
    func setDefaultNotiCheck(_ text: Bool) {
        objCommon.set(text, forKey: "DefaultNotiCheck")
        objCommon.synchronize()
    }
    func getDefaultNotiCheck() -> Bool {
        return objCommon.bool(forKey: "DefaultNotiCheck")
    }
    
    // method for notification default time
    func getDefaultNotiTime() -> String {
        if objCommon.string(forKey: "DefaultNotiTime") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DefaultNotiTime")!
        }
    }
    func setDefaultNotiTime(_ text: String) {
        objCommon.setValue(text, forKey: "DefaultNotiTime")
        objCommon.synchronize()
    }
    
    // method for notification pending
    func getIsPendingNotiSett() -> Bool {
        return objCommon.bool(forKey: "IsPendingNotiSett")
    }
    
    func setIsPendingNotiSett(_ text: Bool) {
        objCommon.set(text, forKey: "IsPendingNotiSett")
        objCommon.synchronize()
    }
    
    ////////////Trip & notes Data
    // method for Trip delete IDs
    func getTripDeleteServerID() -> String {
        if objCommon.string(forKey: "TripDeleteServerID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "TripDeleteServerID")!
        }
    }
    func setTripDeleteServerID(_ text: String) {
        objCommon.setValue(text, forKey: "TripDeleteServerID")
        objCommon.synchronize()
    }
    
    // method for Notes delete IDs
    func getNotesDeleteServerID() -> String {
        if objCommon.string(forKey: "NotesDeleteServerID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "NotesDeleteServerID")!
        }
    }
    func setNotesDeleteServerID(_ text: String) {
        objCommon.setValue(text, forKey: "NotesDeleteServerID")
        objCommon.synchronize()
    }
    
    ////////////
    
    //////Add new Device
    //Device licence Verification
    func getDeviceLicenceVerify() -> String {
        if objCommon.string(forKey: "DeviceLicenceVerify") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DeviceLicenceVerify")!
        }
    }
    func setDeviceLicenceVerify(_ text: String) {
        objCommon.setValue(text, forKey: "DeviceLicenceVerify")
        objCommon.synchronize()
    }
    
    //Device licence Verification Type
    func getDeviceLicTypeVerify() -> String {
        if objCommon.string(forKey: "DeviceLicTypeVerify") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DeviceLicTypeVerify")!
        }
    }
    func setDeviceLicTypeVerify(_ text: String) {
        objCommon.setValue(text, forKey: "DeviceLicTypeVerify")
        objCommon.synchronize()
    }
    //Device VTS Sim number
    func getDeviceVTSSimNumber() -> String {
        if objCommon.string(forKey: "DeviceVTSSimNumber") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DeviceVTSSimNumber")!
        }
    }
    func setDeviceVTSSimNumber(_ text: String) {
        objCommon.setValue(text, forKey: "DeviceVTSSimNumber")
        objCommon.synchronize()
    }
    
    //Device IMEI number
    func getDeviceIMEINumber() -> String {
        if objCommon.string(forKey: "DeviceIMEINumber") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DeviceIMEINumber")!
        }
    }
    func setDeviceIMEINumber(_ text: String) {
        objCommon.setValue(text, forKey: "DeviceIMEINumber")
        objCommon.synchronize()
    }
    
    //Device Vehicle Number
    func getDeviceVehicleNumber() -> String {
        if objCommon.string(forKey: "DeviceVehicleNumber") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DeviceVehicleNumber")!
        }
    }
    func setDeviceVehicleNumber(_ text: String) {
        objCommon.setValue(text, forKey: "DeviceVehicleNumber")
        objCommon.synchronize()
    }
    
    //Device Features ID
    func getDeviceFeaturesID() -> String {
        if objCommon.string(forKey: "DeviceFeaturesID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DeviceFeaturesID")!
        }
    }
    func setDeviceFeaturesID(_ text: String) {
        objCommon.setValue(text, forKey: "DeviceFeaturesID")
        objCommon.synchronize()
    }
    
    //Device From KM
    func getDeviceFromKm() -> String {
        if objCommon.string(forKey: "DeviceFromKm") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DeviceFromKm")!
        }
    }
    func setDeviceFromKm(_ text: String) {
        objCommon.setValue(text, forKey: "DeviceFromKm")
        objCommon.synchronize()
    }
    
    //Device Chassis Number
    func getDeviceChassisNumber() -> String {
        if objCommon.string(forKey: "DeviceChassisNumber") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DeviceChassisNumber")!
        }
    }
    func setDeviceChassisNumber(_ text: String) {
        objCommon.setValue(text, forKey: "DeviceChassisNumber")
        objCommon.synchronize()
    }
    ////End Add Device
    
    //Pref for data usage
    //for mobile data usage
    func getISMobDataUsageON() -> Bool {
        return objCommon.bool(forKey: "ISMobDataUsageON")
    }
    func setISMobDataUsageON(_ text: Bool) {
        objCommon.set(text, forKey: "ISMobDataUsageON")
        objCommon.synchronize()
    }
    
    //for wifi data usage
    func getISWifiDataUsageON() -> Bool {
        return objCommon.bool(forKey: "ISWifiDataUsageON")
    }
    func setISWifiDataUsageON(_ text: Bool) {
        objCommon.set(text, forKey: "ISWifiDataUsageON")
        objCommon.synchronize()
    }
    
    //for roaming data usage
    func getISRoamingDataUsageON() -> Bool {
        return objCommon.bool(forKey: "ISRoamingDataUsageON")
    }
    func setISRoamingDataUsageON(_ text: Bool) {
        objCommon.set(text, forKey: "ISRoamingDataUsageON")
        objCommon.synchronize()
    }
    
    //for RVR System Enable
    func getIsRVRSystemEnable() -> Bool {
        return objCommon.bool(forKey: "IsRVRSystemEnable")
    }
    func setIsRVRSystemEnable(_ text: Bool) {
        objCommon.set(text, forKey: "IsRVRSystemEnable")
        objCommon.synchronize()
    }
    
    //Security Lock
    
    func getPatternString() -> String {
        if objCommon.string(forKey: "PatternString") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "PatternString")!
        }
    }
    func setPatternString(_ text: String) {
        objCommon.setValue(text, forKey: "PatternString")
        objCommon.synchronize()
    }
    
    func getTempPatternString() -> String {
        if objCommon.string(forKey: "TempPatternString") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "TempPatternString")!
        }
    }
    func setTempPatternString(_ text: String) {
        objCommon.setValue(text, forKey: "TempPatternString")
        objCommon.synchronize()
    }
    
    func getNumberPINString() -> String {
        if objCommon.string(forKey: "NumberPINString") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "NumberPINString")!
        }
    }
    func setNumberPINString(_ text: String) {
        objCommon.setValue(text, forKey: "NumberPINString")
        objCommon.synchronize()
    }
    
    func getTempPINString() -> String {
        if objCommon.string(forKey: "TempPINString") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "TempPINString")!
        }
    }
    func setTempPINString(_ text: String) {
        objCommon.setValue(text, forKey: "TempPINString")
        objCommon.synchronize()
    }
    
    //for security lock Enable
    func getIsSecurityLockEnable() -> Bool {
        return objCommon.bool(forKey: "IsSecurityLockEnable")
    }
    func setIsSecurityLockEnable(_ text: Bool) {
        objCommon.set(text, forKey: "IsSecurityLockEnable")
        objCommon.synchronize()
    }
    
    func setTimeZone(_ text: String) {
        objCommon.setValue(text, forKey: "TimeZone")
        objCommon.synchronize()
    }
    func getTimeZone() -> String {
        if objCommon.string(forKey: "TimeZone") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "TimeZone")!
        }
    }
    func setTimeZoneID(_ text: String) {
        objCommon.setValue(text, forKey: "TimeZoneID")
        objCommon.synchronize()
    }
    func getTimeZoneID() -> String {
        if objCommon.string(forKey: "TimeZoneID") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "TimeZoneID")!
        }
    }
    
    //Device batch num
    func setDeviceBatchNo(_ text: String) {
        objCommon.setValue(text, forKey: "DeviceBatchNo")
        objCommon.synchronize()
    }
    func getDeviceBatchNo() -> String {
        if objCommon.string(forKey: "DeviceBatchNo") == nil {
            return ""
        } else {
            return objCommon.string(forKey: "DeviceBatchNo")!
        }
    }
}
