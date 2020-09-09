import UIKit

class Navigator {
    
    // MARK: - DisplayVCType enum

    enum DisplayVCType {
        case push
        case present
    }
    
    // MARK: - Properties
    
    private var viewController: UIViewController
    static private let mainSBName = "Main"

    // MARK: - Init

    init(vc: UIViewController) {
        self.viewController = vc
    }
    
    
    // MARK: - Public Methods
    
    /// Instaniate UIViewController in the certain Storyboard.
    /// - Parameters:
    ///   - vcType: class type of destination vc
    ///   - sbName: name of storyboard where destination vc is
    /// - Returns: destination view controller
    public func instantiateVC<T>(withDestinationViewControllerType vcType: T.Type,
                                            andStoryboardName sbName: String = mainSBName) -> T? where T: UIViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name: sbName, bundle: nil)
        let destinationVC = storyBoard.instantiateViewController(withIdentifier: String(describing: vcType.self))

        return destinationVC as? T
    }
    
    /// Moves to destination ViewController in certain style.
    /// - Parameters:
    ///   - destinationVC: destination view controller
    ///   - type: push or modal
    ///   - style: if modal type, style of modal presentation
    public func goTo(viewController destinationVC: UIViewController,
              withDisplayVCType type: DisplayVCType = .present,
              andModalPresentationStyle style: UIModalPresentationStyle = .popover) {
        switch type {
        case .push:
            viewController.navigationController?.pushViewController(destinationVC, animated: true)
        case .present:
            destinationVC.modalPresentationStyle = style
            viewController.present(destinationVC, animated: true, completion: nil)
        }
    }
}

