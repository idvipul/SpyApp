import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var secretField: UITextField!
    @IBOutlet weak var output: UILabel!

    var integerSecret: UInt32 {
        guard let secretString = secretField.text else {
            return 0
        }
        if let secretInt = UInt32(secretString) {
            return secretInt
        } else {
            return 0
        }
    }


    @IBAction func encryptButton(_ sender: Any) {
        guard
            let plaintext = inputField.text,
            let secretString = secretField.text
        else {
            output.text = "No values provided"
            return
        }

        var encoded = ""
        for character in plaintext {
            guard let firstUnicodeScalar = character.unicodeScalars.first else {
                continue
            }
            let unicode = firstUnicodeScalar.value
            let shiftedUnicode = unicode + integerSecret
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))

            encoded += shiftedCharacter
        }

        output.text = encoded
    }
}
