import UIKit

class PokemonCell: UITableViewCell {
    
    private let pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(pokemonImageView)
        addSubview(nameLabel)
        
        selectionStyle = .none
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        pokemonImageView.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, width: 100, height: 100, topPadding: 10, bottomPadding: 10, leadingPadding: 10)
        nameLabel.anchor(leading: pokemonImageView.trailingAnchor, trailing: trailingAnchor, centerY: pokemonImageView.centerYAnchor, topPadding: 10, bottomPadding: 10, leadingPadding: 10, trailingPadding: 10)
    }
    
    func configure(usingViewModel viewModel: PokemonCellVMProtocol) {
        pokemonImageView.image = UIImage(named: viewModel.imageName)
        nameLabel.text = viewModel.name
    }
}

extension UITableViewCell {
    static var id: String {
        String(describing: Self.self)
    }
}
