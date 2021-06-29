//
// Created on 2019/10/06
// Copyright © 2019年, yugo.sugiyama. All rights reserved.
//

import UIKit
import CryptoKit
import CoreImage.CIFilterBuiltins

public extension String {
    var percentEscaped: String? {
        addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }

    var asInt: Int? {
        Int(self)
    }

    var asURL: URL? {
        return URL(string: self)
    }

    var asNSAttributedString: NSAttributedString {
        return NSAttributedString(string: self)
    }

    var convertUpperToLower: String {
        self.lowercased()
    }

    var capitalizingFirstLetter: String {
        let strLower = convertUpperToLower
        return String(strLower.prefix(1)).uppercased() + String(strLower.dropFirst())
    }

    var isValidEmail: Bool {
        let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let testEmail = NSPredicate(format: "SELF MATCHES %@", regularExpressionForEmail)
        return testEmail.evaluate(with: self)
    }

    var isValidPhone: Bool {
       let regularExpressionForPhone = "^\\d{3}-\\d{3}-\\d{4}$"
       let testPhone = NSPredicate(format: "SELF MATCHES %@", regularExpressionForPhone)
       return testPhone.evaluate(with: self)
    }

    var sha256: String {
      let inputData = Data(utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        return String(format: "%02x", $0)
      }.joined()
      return hashString
    }

    static var randomAllText: String {
        let length = Int.random(in: 0...300)
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん"
        var randomString: String = ""

        for _ in 0...length {
            let randomValue = Int.random(in: 0 ... base.count - 1)
            let index: Index = base.index(base.startIndex, offsetBy: randomValue)
            let character: Character = base[index]
            randomString += String(character)
        }
        return randomString
    }

    static var random: String {
        let length = Int.random(in: 0...300)
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ012345678"
        var randomString: String = ""

        for _ in 0...length {
            let randomValue = Int.random(in: 0 ... base.count - 1)
            let index: Index = base.index(base.startIndex, offsetBy: randomValue)
            let character: Character = base[index]
            randomString += String(character)
        }
        return randomString
    }

    func trim(characterSet: CharacterSet = .whitespaces) -> String {
        trimmingCharacters(in: characterSet)
    }

    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.width)
    }

    static func random(length: Int? = nil) -> String {
        let adjustedLength = length ?? .random(in: 0...300)
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""

        for _ in 0..<adjustedLength {
            let randomValue = Int.random(in: 0 ... base.count - 1)
            let index: Index = base.index(base.startIndex, offsetBy: randomValue)
            let character: Character = base[index]
            randomString += String(character)
        }
        return randomString
    }

    // Adapted from https://auth0.com/docs/api-auth/tutorials/nonce#generate-a-cryptographically-random-nonce
    static func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: Array<Character> =
          Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }
      return result
    }

    // https://medium.com/@dominicfholmes/generating-qr-codes-in-swift-4-b5dacc75727c
    var qRCodeConverted: UIImage? {
        // Get data from the string
        let data = self.data(using: String.Encoding.ascii)
        // Get a QR CIFilter
        let qrFilter = CIFilter.qrCodeGenerator()
        // Input the data
        qrFilter.setValue(data, forKey: "inputMessage")
        qrFilter.setValue("Q", forKey: "inputCorrectionLevel")
        // Get the output image
        guard let qrImage = qrFilter.outputImage else { return nil }
        // Scale the image
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledQrImage = qrImage.transformed(by: transform)
//        return UIImage(ciImage: scaledQrImage)
        // Invert the colors
        guard let colorInvertFilter = CIFilter(name: "CIColorInvert") else { return nil }
        colorInvertFilter.setValue(scaledQrImage, forKey: "inputImage")
        guard let outputInvertedImage = colorInvertFilter.outputImage else { return nil }
        // Replace the black with transparency
        guard let maskToAlphaFilter = CIFilter(name: "CIMaskToAlpha") else { return nil }
        maskToAlphaFilter.setValue(outputInvertedImage, forKey: "inputImage")
        guard let outputCIImage = maskToAlphaFilter.outputImage else { return nil }
        // Do some processing to get the UIImage
        let context = CIContext()
        guard let cgImage = context.createCGImage(outputCIImage, from: outputCIImage.extent) else { return nil }
        return UIImage(cgImage: cgImage)
    }
}
