import UIKit

class InstaTypeViewController: UIViewController {

    let mockImageNamed = Array(1...23)
    
    private lazy var shoppingTableView: UITableView = {
        let table = UITableView()
        table.register(InstaTypeCustomCell.self,
                       forCellReuseIdentifier: InstaTypeCustomCell.reuseIdentifier)
        table.backgroundColor = .mBackground
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
        view.backgroundColor = .mBackground
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(shoppingTableView)
        
        NSLayoutConstraint.activate([
            shoppingTableView.topAnchor.constraint(equalTo: view.topAnchor),
            shoppingTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            shoppingTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            shoppingTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
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
        let vc = SingleImageViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.selectedImage = UIImage(named: "\(self.mockImageNamed[indexPath.row])")
        self.present(vc, animated: true)
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
        cell.selectionStyle = .none
        cell.backgroundColor = .mBackground
        return cell
    }
}

