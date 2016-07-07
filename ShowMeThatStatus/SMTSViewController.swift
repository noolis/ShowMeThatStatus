//
//  SMTSViewController.swift
//  ShowMeThatStatus
//
//  Created by Tomasz Kopycki on 21/04/16.
//  Copyright © 2016 Noolis. All rights reserved.
//

import UIKit

public class SMTSViewController: UIViewController {
    
    private var statusMessage: String!
    private var actions = [SMTSAction]()
    private var status: SMTSProgressStatus = .Unknown
    
    var style = SMTSConstants.smtsStyle
    
    //MARK: - Outlets
    
    @IBOutlet private weak var statusIndicator: StatusIndicator!
    @IBOutlet private weak var lblStatus: UILabel!
    @IBOutlet private weak var svActions: UIStackView!
    @IBOutlet private weak var constrStackViewHeight: NSLayoutConstraint!
    @IBOutlet private weak var vPlaceholder: UIView!

    //MARK: - Init
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        transitioningDelegate = SMTSConstants.tm
        modalPresentationStyle = .Custom
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    public convenience init(status: SMTSProgressStatus, message: String = "") {
        
        self.init(nibName: SMTSConstants.SMTSVCNibName,
                  bundle: NSBundle(forClass: SMTSViewController.self))
        self.status = status
        self.statusMessage = message
    }
    
    public convenience init() {
        
        self.init(nibName: SMTSConstants.SMTSVCNibName,
                  bundle: NSBundle(forClass: SMTSViewController.self))
    }
    
    //MARK: - View life cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setAppearance()
    }
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        for action in actions {
            
            action.button.hidden = true
            if self.svActions != nil {
                self.svActions.addArrangedSubview(action.button)
            }
            
        }
        
        changeStatusTo(status, message: statusMessage, progress: 0)
    }
    
    //MARK: - Updates

    public func changeStatusTo(status: SMTSProgressStatus, message: String? = nil,
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
        case .Loading:
            statusIndicator.startLoading()
            statusIndicator.strokeColor = style.progressColor
            lblStatus.textColor = style.progressColor
        case .Failure:
            statusIndicator.completeLoading(false, completion: didFinishAnimating)
            statusIndicator.strokeColor = style.failureColor
            lblStatus.textColor = style.failureColor
        case .Success:
            statusIndicator.completeLoading(true, completion: didFinishAnimating)
            statusIndicator.strokeColor = style.successColor
            lblStatus.textColor = style.successColor
        default: break
        }
        
        updateStackView()
        updateSize()
    }
    
    
    public func addActionWithTitle(title: String, visibleForStates states: [SMTSProgressStatus] = [.All],
                                   ofType type: SMTSActionType = .Default, actionBlock: () -> ()) {
        
        let action = SMTSAction(title: title,
                                actionBlock: actionBlock,
                                visibleStates: states,
                                type: type)
        actions.append(action)
    }
    
    private func updateSize() {
        
        let size: CGSize = statusMessage
            .boundingRectWithSize(CGSizeMake(style.width - 20, 2000),
                                  options:NSStringDrawingOptions.UsesLineFragmentOrigin,
                                  attributes: [NSFontAttributeName: style.statusFont],
                                  context: nil).size as CGSize
        
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5,
                                   initialSpringVelocity: 0.8, options: [], animations: {
                                    
            self.view.frame.size = CGSize(width: SMTSConstants.smtsStyle.width,
                height: 40 + 90 + size.height + self.constrStackViewHeight.constant)
                                    
            }, completion: nil)
    }
    
    private func updateStackView() {
        
        let shown = actions.filter({return $0.visibleStates.contains(self.status) ||
            $0.visibleStates.contains(.All)}).count
        
        switch shown {
        case 0, 1:
            constrStackViewHeight.constant = 45
        default:
            constrStackViewHeight.constant = CGFloat(shown * 50 - 5)
        }
        
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5,
                                   initialSpringVelocity: 0.8, options: [], animations: {
                self.view.layoutIfNeeded()
                
                self.vPlaceholder.hidden = shown != 0
                
                for action in self.actions {
                    action.button.hidden = !(action.visibleStates.contains(self.status) ||
                        action.visibleStates.contains(.All))
                }
            }, completion: { finished in
                
                for action in self.actions {
                    action.button.hidden = !(action.visibleStates.contains(self.status) ||
                        action.visibleStates.contains(.All))
                }
        })
        
    }
    
    
    //MARK: - Appearance
    
    private func setAppearance() {
        
        lblStatus.font = style.statusFont
        statusIndicator.strokeColor = style.progressColor
        statusIndicator.lineWidth = style.lineWidth
        lblStatus.textColor = style.progressColor
        view.backgroundColor = style.backgroundColor
        view.layer.borderColor = style.borderColor
        view.layer.borderWidth = style.borderWidth
        view.layer.cornerRadius = style.viewCornerRadius
        
        svActions.alignment = .Fill
        svActions.distribution = .FillEqually
        svActions.axis = .Vertical
        svActions.spacing = 5
        svActions.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
