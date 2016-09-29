//
//  SMTSViewController.swift
//  ShowMeThatStatus
//
//  Created by Tomasz Kopycki on 21/04/16.
//  Copyright © 2016 Noolis. All rights reserved.
//

import UIKit

open class SMTSViewController: UIViewController {
    
    fileprivate var statusMessage: String!
    fileprivate var actions = [SMTSAction]()
    fileprivate var status: SMTSProgressStatus = .unknown
    
    var style = SMTSConstants.smtsStyle
    
    //MARK: - Outlets
    
    @IBOutlet fileprivate weak var statusIndicator: StatusIndicator!
    @IBOutlet fileprivate weak var lblStatus: UILabel!
    @IBOutlet fileprivate weak var svActions: UIStackView!
    @IBOutlet fileprivate weak var constrStackViewHeight: NSLayoutConstraint!
    @IBOutlet fileprivate weak var vPlaceholder: UIView!

    //MARK: - Init
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        transitioningDelegate = SMTSConstants.tm
        modalPresentationStyle = .custom
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    public convenience init(status: SMTSProgressStatus, message: String = "") {
        
        self.init(nibName: SMTSConstants.SMTSVCNibName,
                  bundle: Bundle(for: SMTSViewController.self))
        self.status = status
        self.statusMessage = message
    }
    
    public convenience init() {
        
        self.init(nibName: SMTSConstants.SMTSVCNibName,
                  bundle: Bundle(for: SMTSViewController.self))
    }
    
    //MARK: - View life cycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        setAppearance()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for action in actions {
            
            action.button.isHidden = true
            if self.svActions != nil {
                self.svActions.addArrangedSubview(action.button)
            }
            
        }
        
        changeStatusTo(status, message: statusMessage, progress: 0)
    }
    
    //MARK: - Updates

    open func changeStatusTo(_ status: SMTSProgressStatus, message: String? = nil,
                        progress: Float? = nil,
                        didFinishAnimating: StatusIndicatorBlock? = nil) {
        
        self.status = status
        
        if message != nil {
            statusMessage = message
            lblStatus.text = message
        }
        
        if let progress = progress {
            statusIndicator.progress = progress
        }
        
        switch status {
        case .loading:
            statusIndicator.startLoading()
            statusIndicator.strokeColor = style.progressColor
            lblStatus.textColor = style.progressColor
        case .failure:
            statusIndicator.completeLoading(false, completion: didFinishAnimating)
            statusIndicator.strokeColor = style.failureColor
            lblStatus.textColor = style.failureColor
        case .success:
            statusIndicator.completeLoading(true, completion: didFinishAnimating)
            statusIndicator.strokeColor = style.successColor
            lblStatus.textColor = style.successColor
        default: break
        }
        
        updateStackView()
        updateSize()
    }
    
    
    open func addActionWithTitle(_ title: String,
                                 visibleForStates states: [SMTSProgressStatus] = [.all],
                                 ofType type: SMTSActionType = .default,
                                 actionBlock: @escaping () -> ()) {
        
        let action = SMTSAction(title: title,
                                actionBlock: actionBlock,
                                visibleStates: states,
                                type: type)
        actions.append(action)
    }
    
    fileprivate func updateSize() {
        
        let size: CGSize = statusMessage
            .boundingRect(with: CGSize(width: style.width - 20, height: 2000),
                                  options:NSStringDrawingOptions.usesLineFragmentOrigin,
                                  attributes: [NSFontAttributeName: style.statusFont],
                                  context: nil).size as CGSize
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5,
                                   initialSpringVelocity: 0.8, options: [], animations: {
                                    
            self.view.frame.size = CGSize(width: self.style.width,
                height: 40 + 90 + size.height + self.constrStackViewHeight.constant)
                                    
            }, completion: nil)
    }
    
    fileprivate func updateStackView() {
        
        let shown = actions.filter({return $0.visibleStates.contains(self.status) ||
            $0.visibleStates.contains(.all)}).count
        
        switch shown {
        case 0, 1:
            constrStackViewHeight.constant = 45
        default:
            constrStackViewHeight.constant = CGFloat(shown * 50 - 5)
        }
        
        DispatchQueue.main.async { 
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5,
                                       initialSpringVelocity: 0.8, options: [], animations: {
                                        self.view.layoutIfNeeded()
                                        
                                        self.vPlaceholder.isHidden = shown != 0
                                        
                                        for action in self.actions {
                                            action.button.isHidden = !(action.visibleStates.contains(self.status) ||
                                                action.visibleStates.contains(.all))
                                        }
                }, completion: { finished in
                    
                    for action in self.actions {
                        action.button.isHidden = !(action.visibleStates.contains(self.status) ||
                            action.visibleStates.contains(.all))
                    }
            })
        }
        
    }
    
    
    //MARK: - Appearance
    
    fileprivate func setAppearance() {
        
        lblStatus.font = style.statusFont
        statusIndicator.strokeColor = style.progressColor
        statusIndicator.lineWidth = style.lineWidth
        lblStatus.textColor = style.progressColor
        view.backgroundColor = style.backgroundColor
        view.layer.borderColor = style.backgroundBorderColor
        view.layer.borderWidth = style.borderWidth
        view.layer.cornerRadius = style.viewCornerRadius
        
        view.layer.shadowColor = style.shadowColor
        view.layer.shadowRadius = 5.0
        view.layer.shadowOpacity = style.shadowOpacity
        
        svActions.alignment = .fill
        svActions.distribution = .fillEqually
        svActions.axis = .vertical
        svActions.spacing = 5
        svActions.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
