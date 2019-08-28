//___FILEHEADER___

import UIKit

class ___VARIABLE_viewController___: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var scrollView: UIScrollView?
    @IBOutlet private weak var itemFormView: ___VARIABLE_modelName___DetailView?

    // MARK: - Variables
    var item: ___VARIABLE_modelName___?

    // MARK: - View Controller Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        self.scrollView?.refreshControl = UIRefreshControl()
        self.scrollView?.refreshControl?.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)

        self.itemFormView?.configure(item: self.item)
    }

    // MARK: - Functions
    @IBAction private func refresh(_ sender: Any) {
        // Query
    }

    @IBAction private func edit(_ sender: Any) {
        // Navigate to formVC
    }
}
