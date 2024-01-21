let blockchain = Blockchain()
blockchain.addBlock(data: "First block")
blockchain.addBlock(data: "Second block")

print(blockchain.isValid())  // Should print true
