import UIKit

class RouletteWheelView: UIView {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setImage(_ image: UIImage) {
        imageView.image = image
    }
    
    func spin(duration: Double, completion: (() -> Void)? = nil) {
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = CGFloat(Double.pi * 2)
        rotation.duration = duration
        rotation.repeatCount = .infinity
        imageView.layer.add(rotation, forKey: "spinAnimation")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.imageView.layer.removeAnimation(forKey: "spinAnimation")
            completion?()
        }
    }
    
    private func setupView() {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
