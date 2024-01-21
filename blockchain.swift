import Foundation

struct Block: Codable {
    var index: Int
    var timestamp: String
    var data: String
    var previousHash: String
    var hash: String

    func generateHash() -> String {
        let stringToHash = "\(index)\(timestamp)\(data)\(previousHash)"
        return stringToHash.data(using: .utf8)!.base64EncodedString()
    }
}

class Blockchain {
    private(set) var blocks: [Block]

    init() {
        self.blocks = [Block(index: 0, timestamp: "\(Date())", data: "Genesis Block", previousHash: "0", hash: "")]
    }

    func addBlock(data: String) {
        let lastIndex = self.blocks.count - 1
        let lastBlock = self.blocks[lastIndex]
        let newBlock = Block(index: lastIndex + 1,
                             timestamp: "\(Date())",
                             data: data,
                             previousHash: lastBlock.hash,
                             hash: "")

        self.blocks.append(newBlock)
    }

    func isValid() -> Bool {
        for i in 1..<blocks.count {
            let currentBlock = blocks[i]
            let previousBlock = blocks[i-1]
            if currentBlock.hash != currentBlock.generateHash() ||
               currentBlock.previousHash != previousBlock.hash {
                return false
            }
        }
        return true
    }
}
