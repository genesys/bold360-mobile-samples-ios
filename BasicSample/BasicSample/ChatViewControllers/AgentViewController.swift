// ===================================================================================================
// Copyright © 2019 bold360ai(LogMeIn).
// Bold360AI SDK.
// All rights reserved.
// ===================================================================================================

import UIKit
import Bold360AI

class AgentViewController: BotDemoViewController, AccountProvider {
    var accountExtraData: AccountExtraData = LiveAccountExtraData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatController.accountProvider = self
        // Do any additional setup after loading the view.
    }
    
    @objc func endChat(_ sender: UIBarButtonItem) {
        self.chatController.endChat()
    }
    
    override func shouldPresentChatViewController(_ viewController: UINavigationController!) {
        super.shouldPresentChatViewController(viewController)
//        viewController.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "End Chat", style: .plain, target: self, action: #selector(AgentViewController.endChat(_:)))
    }
}

// FileUpload delegate implementation
extension AgentViewController: UIDocumentPickerDelegate {
    public func documentMenu(_ documentMenu:UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        self.navigationController?.presentedViewController?.present(documentPicker, animated: true, completion: nil)
    }
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        let request = UploadRequest()
        request.fileName = "fileName.pdf"
        request.fileType = .default
        
        var data: Data!
        
        if FileManager.default.fileExists(atPath: urls.first!.path) {
            data = FileManager.default.contents(atPath: urls.first!.path)
        }
        
        request.fileData = data
        
        self.chatController.uploadFile(request, progress: { (progress) in
            print("application file upload progress ->")
        }) { (info) in
            if((info.error) != nil) {
                print(info.error.localizedDescription)
                
                let alert = UIAlertController(title: "Error", message:info.error.localizedDescription, preferredStyle: UIAlertController.Style.alert)

                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                // show the alert
                self.navigationController?.presentedViewController?.present(alert, animated: true, completion: nil)
            }
            self.chatController.handle(BoldEvent.fileUploaded(info))
        }
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
    }
}

