//___FILEHEADER___

import UIKit

import UIKit

class ___VARIABLE_modelName___TableDataSource: NSObject {
    // MARK: - Variables
    private var items: [[___VARIABLE_modelName___]] = []
    private var filteredItems: [[___VARIABLE_modelName___]] = []

    private var displayItems: [[___VARIABLE_modelName___]] {
        return self.isFiltering ? self.filteredItems : self.items
    }

    var isFiltering: Bool = false

    // MARK: - Initializers
    init(items: [___VARIABLE_modelName___] = []) {
        self.items = [items]
    }

    // MARK: - Functions
    func setItems(items: [___VARIABLE_modelName___] = []) {
        self.items = [items]
    }

    func item(at indexPath: IndexPath) -> ___VARIABLE_modelName___? {
        guard
            self.displayItems.indices.contains(indexPath.section),
            self.displayItems[indexPath.section].indices.contains(indexPath.item)
            else {
                return nil
        }

        return self.displayItems[indexPath.section][indexPath.row]
    }

    func noOfItems(in section: Int) -> Int {
        return self.displayItems[section].count
    }

    func noOfSections() -> Int {
        return self.displayItems.count
    }

    func localSearch(_ searchText: String? = nil) {
        guard let searchText = searchText, !searchText.isEmpty else {
            self.isFiltering = false
            return
        }

        self.isFiltering = true
        let allItems: [___VARIABLE_modelName___] = self.items.flatMap { $0 }
        self.filteredItems = [allItems.filter { $0.title?.lowercased().contains(searchText) ?? false }]
    }
}

// MARK: - UITableViewDataSource
extension ___VARIABLE_modelName___TableDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.noOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.noOfItems(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ___VARIABLE_modelName___TableCell.reusableIdentifier, for: indexPath) as? ___VARIABLE_modelName___TableCell else {
            fatalError("Table view was not properly configured for:  \(___VARIABLE_modelName___TableCell.reusableIdentifier)")
        }

        cell.configure(item: self.item(at: indexPath))
        return cell
    }
}
