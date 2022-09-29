// ===================================================================================================
// Copyright © 2019 bold360ai(LogMeIn).
// Bold360AI SDK.
// All rights reserved.
// ===================================================================================================

import Foundation
import Photos
import Bold360AI
import MobileCoreServices

class FileUploadDemoViewController: AgentViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func didClickUploadFile() {
        let types = [kUTTypePDF, kUTTypeText, kUTTypeRTF, kUTTypeSpreadsheet, kUTTypeDiskImage]
        let documentPicker = UIDocumentPickerViewController(documentTypes: types as [String], in: .import)
        documentPicker.delegate = self
        documentPicker.modalPresentationStyle = .formSheet
        self.navigationController?.presentedViewController?.present(documentPicker, animated: true, completion: nil)
    }
}