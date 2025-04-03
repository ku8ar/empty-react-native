import UIKit

@objc public class EmptyViewController: UIViewController {
    public init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .blue
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
