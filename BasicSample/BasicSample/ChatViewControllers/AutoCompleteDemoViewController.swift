// ===================================================================================================
// Copyright © 2019 bold360ai(LogMeIn).
// Bold360AI SDK.
// All rights reserved.
// ===================================================================================================

import Bold360AI

class AutoCompleteDemoViewController: UIViewController {
    
    var autoCompleteController: AutoCompleteController!
    
    func createAccount() -> Account {
        let account = BotAccount()
        account.account = "jio"
        account.knowledgeBase = "Staging_Updated"
        account.perform(Selector.init(("setServer:")), with:"qa07")
        //        account.welcomeMessageId = "1386322123"
        
        
        return account
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.autoCompleteController = AutoCompleteController(account: self.createAccount())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        self.autoCompleteController.viewController.view.frame = CGRect(origin: CGPoint(x: 0,y: 150),
                                                size: CGSize(width: self.view.frame.width,
                                                             height: 120))
        self.view.addSubview(self.autoCompleteController.viewController.view)
        self.addChild(self.autoCompleteController.viewController)
    }
}
