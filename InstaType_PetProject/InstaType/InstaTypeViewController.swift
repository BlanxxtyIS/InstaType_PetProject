import UIKit

class InstaTypeViewController: UIViewController {

    let mockImageNamed = Array(1...14)
    
    private lazy var shoppingTableView: UITableView = {
        let table = UITableView()
        table.register(InstaTypeCustomCell.self,
                       forCellReuseIdentifier: InstaTypeCustomCell.reuseIdentifier)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let image = UIImage(named: "\(mockImageNamed[indexPath.row])") else {
            return 0
        }
        let imageInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        let imageViewWidth = tableView.bounds.width - imageInsets.left - imageInsets.right
        let imageWidth = image.size.width
        let scale = imageViewWidth / imageWidth
        let cellHeight = image.size.height * scale + imageInsets.top + imageInsets.bottom
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: nil, message: "Вы нажали на: \(mockImageNamed[indexPath.row])", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            alert.dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension InstaTypeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockImageNamed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: InstaTypeCustomCell.reuseIdentifier,
            for: indexPath) as? InstaTypeCustomCell else {
            return UITableViewCell()
        }
        cell.setupCell(image: "\(mockImageNamed[indexPath.row])",
                       date: dateFormatter.string(from: Date()))
        return cell
    }
}

