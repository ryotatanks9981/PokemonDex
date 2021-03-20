import UIKit
import Lottie
import RxSwift
import RxCocoa
import RxDataSources

class PokemonListViewController: UIViewController, Storyboardable {

    private let  tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        return tableView
    }()
    
    var animationView = AnimationView.createAnimationView(fileName: "launch-animation", animateSpeed: 1.5)
    
    private let dataSources = RxTableViewSectionedReloadDataSource<pokemonItemsSection> { (_, tableView, indexPath, item) -> UITableViewCell in
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonCell.id, for: indexPath) as! PokemonCell
        cell.configure(usingViewModel: item)
        return cell
    }
    
    private var viewModel: PokemonListVMProtocol!
    var viewModelBuilder: PokemonListVMProtocol.ViewModelBuilder!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = viewModelBuilder((pokemonSelected: tableView.rx.modelSelected(PokemonCellViewModel.self).asDriver(), ()))
        
        setupViews()
        
        animationView.play { [weak self](isOver) in
            if isOver {
                self?.animationView.removeFromSuperview()
                self?.tableView.isHidden = false
                DispatchQueue.main.async {
                    self?.navigationController?.navigationBar.isHidden = false
                }
                self?.tableView.reloadData()
            }
        }
        
        setupLayout()
        binding()
    }
    
    private func binding() {
        viewModel.output
            .pokemons
            .drive(tableView.rx.items(dataSource: dataSources))
            .disposed(by: disposeBag)
    }
    
    private func setupViews() {
        view.addSubview(animationView)
        view.addSubview(tableView)
        tableView.register(PokemonCell.self, forCellReuseIdentifier: PokemonCell.id)
        tableView.separatorStyle = .none
    }
    
    private func setupLayout() {
        animationView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, topPadding: view.width / -5)
        tableView.frame = view.bounds
    }
}

