protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get set }
    func start()
}

extension Coordinator {
    func add(_ coordinator: Coordinator) {
        childCoordinator.append(coordinator)
    }
    
    func remove(_ coordinator: Coordinator) {
        childCoordinator = childCoordinator.filter({ $0 !== coordinator })
    }
}

class BaseCoordnator: Coordinator {
    var childCoordinator: [Coordinator] = []
    func start() {
        fatalError("please implements child coordinator.")
    }
}
