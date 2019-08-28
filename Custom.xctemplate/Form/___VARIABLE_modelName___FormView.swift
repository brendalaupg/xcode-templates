//___FILEHEADER___

import UIKit

protocol ___VARIABLE_modelName___FormViewDelegate: class {
    func itemFormView(_ itemFormView: ___VARIABLE_modelName___FormView, didUpdateValidity isValid: Bool)
    func itemFormView(_ itemFormView: ___VARIABLE_modelName___FormView, didCompleteForm completed: Bool)
}

@IBDesignable
public class ___VARIABLE_modelName___FormView: UIView {
    // MARK: - IBOutlets
    @IBOutlet private weak var stringTextField: UITextField?

    private var item: ___VARIABLE_modelName___?

    weak var delegate: ___VARIABLE_modelName___FormViewDelegate?

    private var allTextFields: [UITextField?] {
        return [self.stringTextField]
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        self.allTextFields.forEach { textField in
            textField?.delegate = self
        }
    }

    // MARK: - Functions
    func configure(item: ___VARIABLE_modelName___? = nil) {
        self.item = item
    }

    func model() -> ___VARIABLE_modelName___? {
        return nil
    }

    /// Used to prompt discard changes alert
    func hasChanges() -> Bool {
        return false
    }
}

// MARK: - UITextFieldDelegate
extension ___VARIABLE_modelName___FormView: UITextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case self.stringTextField:
            _ = self.stringTextField?.resignFirstResponder()
            self.delegate?.itemFormView(self, didCompleteForm: true)
        default:
            return
        }
    }
}
