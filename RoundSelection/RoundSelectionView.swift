//
//  RoundSelectionView.swift
//  RoundSelection
//
//  Created by Rudi Luis on 13/04/2019.
//  Copyright © 2019 Telo Technology Limited. All rights reserved.
//

import RxSwift
import RxCocoa
import RxGesture

public class RoundSelectionView: UIView {
    
    // MARK: - Enum
    
    public enum Style {
        case none
        case checkMark
    }
    
    // MARK: - Typealias
    
    public typealias Data = (icon: UIImage?, title: String)
    
    // MARK: - Property
    
    @IBOutlet
    private weak var checkMarkIcon: UIImageView!
    
    @IBOutlet
    private weak var icon: UIImageView!
    
    @IBOutlet
    private weak var titleLabel: UILabel!
    
    private var title = PublishSubject<String>()
    
    private var image = PublishSubject<UIImage>()
    
    private let dispose = DisposeBag()
    
    private var isSelected = false
    
    // MARK: - Output
    
    public var style = Style.none
    
    public var data = Data(icon: UIImage(), title: "") {
        didSet {
            title.onNext(data.title)
            
            guard let img = data.icon else { fatalError("Image not found") }
            
            image.onNext(img)
        }
    }
    
    public var titleData: String {
        guard let title = titleLabel.text else { return "" }
        
        return title
    }
    
    public var checkMarkImage: UIImage? {
        didSet {
            guard let img = checkMarkImage else { fatalError("Image not found") }
            
            checkMarkIcon.image = img
        }
    }
    
    public var colorBackgroundOnSelected: UIColor? {
        didSet {
            //self.layer.sublayers?.remove(at: 0)
        }
    }
    
    public var colorTitleOnSelected: UIColor? {
        didSet {
        }
    }
    
    public var allowMultipleSelection = false
    
    public var didSelected: ((Bool) -> Void)?
    
    // MARK: - Nib
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    /// :nodoc:
    public override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        guard subviews.isEmpty else { return self }
        
        let identifier = RoundSelectionView.self
        let bundle = Bundle(for: identifier)
        let view = bundle.loadNibNamed(
            String(describing: identifier),
            owner: nil
            )?.first as? UIView
        
        view?.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
    
    // MARK: - Setup
    
    private func setup() {
        title.subscribe({ [weak self] in
            self?.titleLabel.text = $0.element
        }).disposed(by: dispose)
        
        image.subscribe({ [weak self] in
            self?.icon.image = $0.element
        }).disposed(by: dispose)
        
        self.rx.tapGesture()
            .when(.recognized)
            .map({ _ in self.isSelected })
            .subscribe(onNext: { [weak self] in
                if let isSelected = self?.isSelected {
                    self?.isSelected = !isSelected
                    
                    if isSelected {
                        self?.drawCircle(with: self?.colorBackgroundOnSelected)
                        self?.titleLabel.textColor = self?.colorTitleOnSelected
                        self?.didSelected?(!$0)
                    } else {
                        self?.drawCircle(with: .clear)
                        self?.titleLabel.textColor = .black
                        self?.didSelected?($0)
                    }
                }
                
            }).disposed(by: dispose)
    }
    
    // MARK: - Draw
    
    private func drawCircle(with color: UIColor?) {
        guard let color = color else { return }
        
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: self.bounds.maxX / 2, y: self.bounds.maxY / 2 + 10),
            radius: CGFloat(55),
            startAngle: CGFloat(0),
            endAngle: CGFloat(Double.pi * 2),
            clockwise: true
        )
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        shapeLayer.fillColor = color.cgColor
        
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 3.0
        
        self.layer.insertSublayer(shapeLayer, at: 0)
    }
}
