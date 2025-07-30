contract vinTradeCovenantBridge {
    mapping(bytes32 => bool) public interChainTreaties;

    event TreatyBridged(bytes32 indexed treatyHash, string chainID);
    
    function bridgeTreaty(string memory title, string memory chainID) public {
        bytes32 hash = keccak256(abi.encodePacked(title, chainID));
        interChainTreaties[hash] = true;
        emit TreatyBridged(hash, chainID);
    }
}
