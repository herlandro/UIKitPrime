//
//  Character.swift
//  UIKitPrime
//
//  Created by Herlandro Hermogenes on 18/04/2018.
//

import UIKit

public extension String {

    var addingPercentEncodingForURLQueryValue: String? {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: generalDelimitersToEncode + subDelimitersToEncode)
        return addingPercentEncoding(withAllowedCharacters: allowed)
    }

    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }

    func localized(withComment comment: String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: comment)
    }

    func localized(_ values: [String]) -> String {
        return String.init(format: NSLocalizedString(self, comment: ""), arguments: values)
    }

    /// return a copy of the string with unscapped chars for :"\0", "\t", "\n", "\r", "\"", "\'", "\\"
    var unescaped: String {
        let entities = ["\0", "\t", "\n", "\r", "\"", "\'", "\\"]
        var current = self

        for entity in entities {

            let descriptionCharacters = entity.debugDescription.dropFirst().dropLast()
            let description = String(descriptionCharacters)
            current = current.replacingOccurrences(of: description, with: entity)
        }
        return current
    }

    func attributedStringFromHtml(_ font: UIFont? = nil) -> NSMutableAttributedString {
        guard let data = data(using: .utf8) else { return NSMutableAttributedString() }
        do {
            let attrString = try NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)

            font.whenNotNil {
                attrString.setFontFace(font: $0)
            }

            return attrString
        } catch {

            return NSMutableAttributedString()
        }
    }

    fileprivate static let ANYONE_CHAR_UPPER = "X"
    fileprivate static let ONLY_CHAR_UPPER = "C"
    fileprivate static let ONLY_NUMBER_UPPER = "N"
    fileprivate static let ANYONE_CHAR = "x"
    fileprivate static let ONLY_CHAR = "c"
    fileprivate static let ONLY_NUMBER = "n"

    var numbers: String {
        return String(describing: filter { String($0).rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789")) != nil })
    }

    func format(_ format: String, oldString: String) -> String {

        let stringUnformated = self.unformat(format, oldString: oldString)
        var newString = String()
        var counter = 0
        if stringUnformated.count == counter {

            return newString
        }
        for i in 0..<format.count {

            var stringToAdd = ""
            let unicharFormatString = format[i]
            let charFormatString = unicharFormatString
            let charFormatStringUpper = unicharFormatString.uppercased()
            let unicharString = stringUnformated[counter]
            let charString = unicharString
            let charStringUpper = unicharString.uppercased()
            if charFormatString == String.ANYONE_CHAR {

                stringToAdd = charString
                counter += 1
            } else if charFormatString == String.ANYONE_CHAR_UPPER {

                stringToAdd = charStringUpper
                counter += 1
            } else if charFormatString == String.ONLY_CHAR_UPPER {

                counter += 1
                if charStringUpper.isChar() {

                    stringToAdd = charStringUpper
                }
            } else if charFormatString == String.ONLY_CHAR {
                counter += 1
                if charString.isChar() {

                    stringToAdd = charString
                }
            } else if charFormatStringUpper == String.ONLY_NUMBER_UPPER {

                counter += 1
                if charString.isNumber() {

                    stringToAdd = charString
                }
            } else {
                stringToAdd = charFormatString
            }

            newString += stringToAdd
            if counter == stringUnformated.count {
                if i == format.count - 2 {
                    let lastUnicharFormatString = format[i + 1]
                    let lastCharFormatStringUpper = lastUnicharFormatString.uppercased()
                    let lasrCharControl = (!(lastCharFormatStringUpper == String.ONLY_CHAR_UPPER) &&
                        !(lastCharFormatStringUpper == String.ONLY_NUMBER_UPPER) &&
                        !(lastCharFormatStringUpper == String.ANYONE_CHAR_UPPER))
                    if lasrCharControl {
                        newString += lastUnicharFormatString
                    }
                }
                break
            }
        }
        return newString
    }

    func unformat(_ format: String, oldString: String) -> String {
        var string: String = self
        var undefineChars = [String]()
        for i in 0..<format.count {
            let unicharFormatString = format[i]
            let charFormatString = unicharFormatString
            let charFormatStringUpper = unicharFormatString.uppercased()
            if !(charFormatStringUpper == String.ANYONE_CHAR_UPPER) &&
                !(charFormatStringUpper == String.ONLY_CHAR_UPPER) &&
                !(charFormatStringUpper == String.ONLY_NUMBER_UPPER) {
                var control = false
                for undefineChar in undefineChars where undefineChar == charFormatString {
                    control = true
                }
                if !control {
                    undefineChars.append(charFormatString)
                }
            }
        }
        if oldString.count - 1 == string.count {
            var changeCharIndex = 0
            for i in 0..<string.count {
                let unicharString = string[i]
                let charString = unicharString
                let unicharString2 = oldString[i]
                let charString2 = unicharString2
                if charString != charString2 {
                    changeCharIndex = i
                    break
                }
            }
            let changedUnicharString = oldString[changeCharIndex]
            let changedCharString = changedUnicharString
            var control = false

            for undefineChar in undefineChars where undefineChar == changedCharString {
                control = true
            }

            if control {
                var i = changeCharIndex - 1
                while i >= 0 {
                    let findUnicharString = oldString[i]
                    let findCharString = findUnicharString
                    var control2 = false
                    for undefineChar in undefineChars where undefineChar == findCharString {
                        control2 = true
                    }
                    if !control2 {
                        string = (oldString as NSString).replacingCharacters(in: NSRange(location: i, length: 1), with: "")
                        break
                    }
                    i -= 1
                }
            }
        }
        for i in 0..<undefineChars.count {
            string = string.replacingOccurrences(of: undefineChars[i], with: "")
        }
        return string
    }

    fileprivate func isChar() -> Bool {
        return self.regexControlString(pattern: "[a-zA-ZğüşöçıİĞÜŞÖÇ]")
    }

    fileprivate func isNumber() -> Bool {
        return self.regexControlString(pattern: "^[0-9]*$")
    }

    fileprivate func regexControlString(pattern: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let numberOfMatches = regex.numberOfMatches(in: self, options: [], range: NSRange(location: 0, length: self.count))
            return numberOfMatches == self.count
        } catch {
            return false
        }
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {

        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }

    subscript (i: Int) -> String {

        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {

        return self[min(fromIndex, count) ..< count]
    }

    func substring(toIndex: Int) -> String {

        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(count, r.lowerBound)),
                                            upper: min(count, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }

    var clearedString: String {

        var newString = self

        newString = newString.components(separatedBy: .whitespaces).joined()
        newString = newString.replacingOccurrences(of: ".", with: String())
        newString = newString.replacingOccurrences(of: ",", with: ".")
        return newString
    }

    @inlinable var containsSpecialCharacters: Bool {
        let validChars = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-=().!_")

        return !containsCharacters(validCharacterSet: validChars)
    }

    func containsCharacters(validCharacterSet: CharacterSet) -> Bool {

        return validCharacterSet.isSuperset(of: CharacterSet(charactersIn: self))
    }

    var isBlank: Bool {

        return allSatisfy({ $0.isWhitespace })
    }

    var isEmptyOrBlank: Bool {

        return self.isEmpty || self.isBlank
    }

    func removeWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }

    func attributedStringFromHtmlWithLineHeight(_ font: UIFont? = nil) -> NSMutableAttributedString {
        guard let data = data(using: .utf8) else { return NSMutableAttributedString() }
        do {
            let attrString = try NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)

            font.whenNotNil {
                attrString.setFontFace(font: $0)
                let strLength = attrString.length
                let style = NSMutableParagraphStyle()
                style.lineSpacing = $0.lineHeight / 4
                attrString.addAttribute(.paragraphStyle, value: style, range: NSRange(location: 0, length: strLength))
            }

            return attrString
        } catch {

            return NSMutableAttributedString()
        }
    }

    /// Split the string in an array
    /// - Parameter length: split at index
    /// - Returns: [String]
    func split(by length: Int) -> [String] {
        var startIndex = self.startIndex
        var results = [Substring]()

        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            results.append(self[startIndex..<endIndex])
            startIndex = endIndex
        }

        return results.map { String($0) }
    }
}
