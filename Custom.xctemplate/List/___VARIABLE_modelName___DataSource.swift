//___FILEHEADER___

import UIKit

class ___VARIABLE_modelName___DataSource: NSObject {
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

// MARK: - UICollectionViewDataSource
extension ___VARIABLE_modelName___DataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.noOfItems(in: section)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.noOfSections()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ___VARIABLE_modelName___Cell.reusableIdentifier, for: indexPath) as? ___VARIABLE_modelName___Cell else {
            fatalError("Collection view was not properly configured for:  \(___VARIABLE_modelName___Cell.reusableIdentifier)")
        }

        cell.configure(item: self.item(at: indexPath))
        return cell
    }
}
