
import UIKit

class InstaTypeViewController: UIViewController {

    let shoppingList = ["Apples"]
    
    private lazy var shoppingTableView: UITableView = {
        let table = UITableView()
        table.register(InstaTypeCustomCell.self,
                       forCellReuseIdentifier: InstaTypeCustomCell.reuseIdentifier)
        table.delegate = self
        table.dataSource = self
        table.sectionHeaderHeight = 50
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingTableView.rowHeight = 200
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(shoppingTableView)
        
        NSLayoutConstraint.activate([
            shoppingTableView.topAnchor.constraint(equalTo: view.topAnchor),
            shoppingTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            shoppingTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shoppingTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension InstaTypeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: nil, message: "Вы нажали на: \(shoppingList[indexPath.row])", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            alert.dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension InstaTypeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shoppingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: InstaTypeCustomCell.reuseIdentifier,
            for: indexPath) as? InstaTypeCustomCell else {
            return UITableViewCell()
        }
        cell.instaImage.image = UIImage(named: "1")
        return cell
    }
}

