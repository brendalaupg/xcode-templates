//___FILEHEADER___

import UIKit

class ___VARIABLE_viewController___: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var scrollView: UIScrollView?

    @IBOutlet private weak var saveButton: UIButton?
    @IBOutlet private weak var saveBarButtonItem: UIBarButtonItem?

    // MARK: - Variables
    var item: ___VARIABLE_modelName___?
    private var itemFormView: ___VARIABLE_modelName___FormView?

    // MARK: - View Controller Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemFormView?.delegate = self
        self.itemFormView?.configure()

        let title: String = self.item == nil ? NSLocalizedString("Create", comment: "") : NSLocalizedString("Update", comment: "")
        self.saveButton?.setTitle(title, for: .normal)
        self.title = title
    }

    // MARK: - Functions
    @IBAction private func submit(_ sender: Any) {

    }

    @IBAction private func back(_ sender: Any) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
    }
}

extension ___VARIABLE_viewController___: ___VARIABLE_modelName___FormViewDelegate {
    func itemFormView(_ itemFormView: ___VARIABLE_modelName___FormView, didUpdateValidity isValid: Bool) {
        self.saveButton?.isEnabled = isValid
    }

    func itemFormView(_ itemFormView: ___VARIABLE_modelName___FormView, didCompleteForm completed: Bool) {
        self.submit(self)
    }
}
