// ===================================================================================================
// Copyright © 2019 bold360ai(LogMeIn).
// Bold360AI SDK.
// All rights reserved.
// ===================================================================================================

import Foundation
import Photos
import Bold360AI
import MobileCoreServices
import UniformTypeIdentifiers

/************************************************************/
// MARK: - Sample Agenda
/************************************************************/
/**
 0. Listen to relevant chat state
 1. Validate file transfer enabled on bold admin console.
 2. Add custom button.
 3. When uploade button tapped, show file selector view.
 4. Once file was picked create upload request.
 5. Once upload request created start upload file process.
 6. Call handle function on ChatController with upload file information.
 7. You can get progress values, to show upload progress bar.
 */

class CustomFileUploadDemoVC: AgentViewController {
    
    lazy var imagePicker: UIImagePickerController = { return UIImagePickerController()}()
    let uploadBtn = UIButton(type: .custom) as UIButton
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didUpdateState(_ event: ChatStateEvent!) {
        switch event.state {
        ///0. Listen to relevant chat state
        case .pending:
            /// 1. Validate file transfer enabled on bold admin console.
            if(self.chatController.isFileTransferEnabled) {
                /// 2. Add custom button.
                DispatchQueue.main.async {
                    self.uploadBtn.backgroundColor = .blue
                    self.uploadBtn.setTitle("Upload File", for: .normal)
                    self.uploadBtn.frame.size = CGSize(width: 150, height: 70)
                    self.uploadBtn.center = (self.navigationController?.visibleViewController?.view.center)!
                    //  3. When uploade button tapped, show file selector view.
                    self.uploadBtn.addTarget(self, action: #selector(self.uploadFile), for: .touchUpInside)
                    self.navigationController?.visibleViewController?.view.addSubview(self.uploadBtn)
                }
            }
            print("ChatStarted")
            break
        default:
            break
        }
    }
    
    @objc func uploadFile(_ sender: UIBarButtonItem) {
        let types = [kUTTypePDF, kUTTypeText, kUTTypeRTF, kUTTypeSpreadsheet, kUTTypeDiskImage]
        let documentPicker = UIDocumentPickerViewController(documentTypes: types as [String], in: .import)
        documentPicker.delegate = self
        documentPicker.modalPresentationStyle = .formSheet
        self.uploadBtn.removeFromSuperview()
        self.navigationController?.presentedViewController?.present(documentPicker, animated: true, completion: nil)
    }
}
