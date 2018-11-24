 import UIKit
 
 extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    // Returns true if the string has at least one character in common with matchCharacters.
    func containsCharactersIn(_ matchCharacters: String) -> Bool {
        let characterSet = CharacterSet(charactersIn: matchCharacters)
        return self.rangeOfCharacter(from: characterSet) != nil
    }
    
    // Returns true if the string contains only characters found in matchCharacters.
    func containsOnlyCharactersIn(_ matchCharacters: String) -> Bool {
        let disallowedCharacterSet = CharacterSet(charactersIn: matchCharacters).inverted
        return self.rangeOfCharacter(from: disallowedCharacterSet) == nil
    }
    
    // Returns true if the string has no characters in common with matchCharacters.
    func doesNotContainCharactersIn(_ matchCharacters: String) -> Bool {
        let characterSet = CharacterSet(charactersIn: matchCharacters)
        return self.rangeOfCharacter(from: characterSet) == nil
    }
    
    // Returns true if the string represents a proper numeric value.
    // This method uses the device's current locale setting to determine
    // which decimal separator it will accept.
    func isNumeric() -> Bool {
        let scanner = Scanner(string: self)
        
        // A newly-created scanner has no locale by default.
        // We'll set our scanner's locale to the user's locale
        // so that it recognizes the decimal separator that
        // the user expects (for example, in North America,
        // "." is the decimal separator, while in many parts
        // of Europe, "," is used).
        scanner.locale = Locale.current
        
        return scanner.scanDecimal(nil) && scanner.isAtEnd
    }
    
    func chopPrefix(_ count: Int = 1) -> String {
        return self.substring(from: self.characters.index(self.startIndex, offsetBy: count))
    }
    
    func chopSuffix(_ count: Int = 1) -> String {
        return self.substring(to: self.characters.index(self.endIndex, offsetBy: -count))
    }
    
    func indexOf(_ target: String) -> Int {
        let range = self.range(of: target)
        if let range = range {
            return self.characters.distance(from: self.startIndex, to: range.lowerBound)
        } else {
            return -1
        }
    }
    
    func lastIndexOf(_ target: String) -> Int? {
        if let range = self.range(of: target, options: .backwards) {
            return characters.distance(from: startIndex, to: range.lowerBound)
        } else {
            return nil
        }
    }
    
    func indexOf(_ source: String, substring: String) -> Int? {
        let maxIndex = source.characters.count - substring.characters.count
        for index in 0...maxIndex {
            let rangeSubstring = source.characters.index(source.startIndex, offsetBy: index)..<source.characters.index(source.startIndex, offsetBy: index + substring.characters.count)
            if source.substring(with: rangeSubstring) == substring {
                return index
            }
        }
        return nil
    }
    
    func substringToIndex(_ index:Int) -> String {
        return self.substring(to: self.characters.index(self.startIndex, offsetBy: index))
    }
    func substringFromIndex(_ index:Int) -> String {
        return self.substring(from: self.characters.index(self.startIndex, offsetBy: index))
    }
    
    func substringWithRange(_ start: Int, end: Int) -> String {
        if (start < 0 || start > self.characters.count)
        {
            print("start index \(start) out of bounds")
            return ""
        }
        else if end < 0 || end > self.characters.count
        {
            print("end index \(end) out of bounds")
            return ""
        }
        let range = self.characters.index(self.startIndex, offsetBy: start) ..< self.characters.index(self.startIndex, offsetBy: end)
        
        return self.substring(with: range)
    }

    
    
    func wordCount() -> Int {
        let c = CharacterSet(charactersIn: " ,")
        let a = self.components(separatedBy: c).filter({!$0.isEmpty})
        return a.count
    }
    
    func isValidEmail() -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        } catch {
            return false
        }
    }
    
    func nullToNil(_ value : AnyObject?) -> AnyObject? {
        if value is NSNull {
            return nil
        } else {
            return value
        }
    }
    
    /// parameter 1
    func replaceString(_ val: String) -> String {
        return replacingOccurrences(of: "\'%1$s\'", with: val)
    }
    /// parameter 2
    func replaceString(_ val1: String, val2: String) -> String {
        return replacingOccurrences(of: "\'%1$s\'", with: val1) + replacingOccurrences(of: "\'%1$s\'", with: val2)
    }
    
    func replaceAll(_ val1: String, val2: String) -> String {
        return replacingOccurrences(of: val1, with: val2)
    }
    
    
        
    var utfData: Data? {
        return self.data(using: .utf8)
    }
    
    var html2AttributedString: NSAttributedString? {
        guard let data = self.utfData else {
            return nil
        }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html,
                                                                .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.characters.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.characters.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    func removeSpecialCharsFromString(_ text: String) -> String {
        let okayChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-*=(),.:!_'".characters)
        return String(text.characters.filter {okayChars.contains($0) })
    }
    
    var asciiArray: [UInt32] {
        return unicodeScalars.filter{$0.isASCII}.map{$0.value}
    }
    
    func matchesForRegexInText(_ regex: String, text: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        } catch {
            return false
        }
    }
    
    func split(_ text: String) -> [String] {
        return self.components(separatedBy: text)
    }
    
    func equals(_ text: String) -> Bool {
        return self == text
    }
    
    func equalsIgnoreCase(_ text: String) -> Bool {
        return self.caseInsensitiveCompare(text) == .orderedSame
    }
    
    func length() -> Int {
        return self.lengthOfBytes(using: String.Encoding.utf8)
    }
    
    func contains(find: String) -> Bool {
        return self.range(of: find) != nil
    }
    
    //method for the get initial of the letter
    func getIntialLetter() -> String {
        var str = ""
        
        let strArr = self.split(" ")
        
        for i in 0 ..< strArr.count {
            str += strArr[i].substringWithRange(0, end: 1)
            if i >= 2 {
                break;
            }
        }
    
        return str.uppercased()
    }
}

class Localization {
    class func convertStringToDictionary(_ text: String) -> NSMutableDictionary? {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? NSMutableDictionary
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
}
