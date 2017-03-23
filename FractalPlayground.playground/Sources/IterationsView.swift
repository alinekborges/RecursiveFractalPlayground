import Foundation
import UIKit

public protocol IterationsDelegate {
    func didSetIteration(_ iteration: Int)
}

public class IterationsView: UIView {
    
    var buttons : [UIButton] = []
    
    var buttonSize: CGSize = CGSize.zero
    
    var delegate: IterationsDelegate?

    var iteration: Int = 4
    
    var colors: [UIColor] = []
    
    public init() {
        
        super.init(frame: CGRect.zero)
        
        colors = Colors.generateColors(numberOfColors: Constants.maxIterations * 2)
        self.clipsToBounds = false
        self.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupButtons() {
        
        let size = self.frame.height
        let leftSize = self.frame.width - CGFloat(Constants.maxIterations) * size
        let spacing = leftSize / CGFloat(Constants.maxIterations + 1)
        
        buttonSize = CGSize(width: size, height: size)
        
        var origin = CGPoint(x: spacing, y: 0)
        for i in 0..<Constants.maxIterations {
            let button = createButton(iteration: i)
            button.frame.origin = origin
            self.addSubview(button)
            origin.x += spacing + size
        }
        
        selectPosition(position: Constants.initialIterations)
    }
    
    func createButton(iteration: Int) -> UIButton {
        let button = UIButton()
        button.frame.size = buttonSize
        
        button.setTitle(String(iteration), for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.backgroundColor = colors[iteration].withAlphaComponent(0.35)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = colors[iteration].cgColor
        button.layer.cornerRadius = buttonSize.width / 2.0
        button.tag = iteration
        
        button.addTarget(self, action: #selector(self.onClick(button:)), for: .touchUpInside)
        button.clipsToBounds = false
        
        buttons.append(button)
        
        return button
    }
    
    func selectPosition(position: Int) {
        for button in buttons {
            button.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }
        
        buttons[position].transform = CGAffineTransform.identity
        
        delegate?.didSetIteration(position)
        self.setNeedsDisplay()
    }
    
    func onClick(button: UIButton) {
        self.iteration = button.tag
        selectPosition(position: button.tag)
        
    }
}
