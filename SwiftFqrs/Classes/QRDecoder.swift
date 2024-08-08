// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public class QRDecoder {
    public static func decodeQRCode(imageData: Data, width: Int32, height: Int32) -> String? {
        let outputBufferSize = 1024 // Adjust as needed
        var outputBuffer = [Int8](repeating: 0, count: outputBufferSize)
        
        let result = imageData.withUnsafeBytes { buffer in
            decode_qr_code(buffer.baseAddress?.assumingMemoryBound(to: UInt8.self),
                           width,
                           height,
                           &outputBuffer,
                           Int32(outputBufferSize))
        }
        
        if result > 0 {
            return String(cString: outputBuffer)
        } else {
            return nil
        }
    }
}
