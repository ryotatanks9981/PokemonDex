import UIKit
import RxSwift
import RxCocoa

class PokemonDetailViewController: UIViewController, Storyboardable {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainTypeLabel: UILabel! {
        didSet {
            mainTypeLabel.layer.cornerRadius = 5
            mainTypeLabel.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var subTypeLabel: UILabel! {
        didSet {
            subTypeLabel.layer.cornerRadius = 5
            subTypeLabel.layer.masksToBounds = true
        }
    }
    
    
    private let disposeBag = DisposeBag()
    
    private var viewModel: PokemonDetailVMProtocol!
    var viewModelBuilder: PokemonDetailVMProtocol.ViewModelBuilder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = viewModelBuilder(())
        
        binding()
    }
    
    private func binding() {
        viewModel.output.pokemon.drive(onNext: { [weak self] pokemon in
            guard let self = self else { return }
            self.imageView.image = UIImage(named: pokemon.imageId)
            self.nameLabel.text = pokemon.name.japanese
            self.mainTypeLabel.text = pokemon.type[0]
            self.mainTypeLabel.backgroundColor = .setTypeColor(typeCase: TypeCase.init(rawValue: pokemon.type[0]) ?? .normal)
            if pokemon.type.count != 1 {
                self.subTypeLabel.text = pokemon.type[1]
                self.subTypeLabel.backgroundColor = .setTypeColor(typeCase: TypeCase.init(rawValue: pokemon.type[1]) ?? .normal)
            }
        }).disposed(by: disposeBag)
    }
    
}
