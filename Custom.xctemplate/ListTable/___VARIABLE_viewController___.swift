//___FILEHEADER___

import UIKit

class ___VARIABLE_viewController___: UITableViewController {

    // MARK: - Variables
    private var dataSource: ___VARIABLE_modelName___TableDataSource = ___VARIABLE_modelName___TableDataSource(items: [])

    var selectAction: ((___VARIABLE_modelName___) -> Void)?

    // MARK: - View Controller Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource.setItems(items: [])
        self.tableView.dataSource = self.dataSource

        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.refreshControl?.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)

        self.refresh(self)
    }

    // MARK: - Functions
    @IBAction private func refresh(_ sender: Any) {
        // Call Query

        self.dataSource.setItems(items: [])
        self.tableView.reloadData()
    }

    @IBAction private func back(_ sender: Any) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
    }

    private func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = NSLocalizedString("Search Items...", comment: "")
        self.navigationItem.searchController = searchController
    }
}

// MARK: - UITableViewDelegate
extension ___VARIABLE_viewController___ {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = self.dataSource.item(at: indexPath) else {
            return
        }

        if let selectAction = self.selectAction {
            selectAction(item)
        } else {
            // Navigate to Detail Screen
        }
    }
}

// MARK: - UISearchResultsUpdating & UISearchBarDelegate
extension ___VARIABLE_viewController___: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        self.dataSource.localSearch(searchController.searchBar.text?.lowercased())
        self.tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dataSource.localSearch()
    }
}
