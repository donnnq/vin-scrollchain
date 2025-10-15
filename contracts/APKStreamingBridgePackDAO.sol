// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract APKStreamingBridgePackDAO {
    address public admin;

    struct BridgeEntry {
        string gameLabel;
        string bridgeClause;
        string emotionalTag;
        bool activated;
    }

    BridgeEntry[] public bridge;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _gameLabel, string memory _bridgeClause, string memory _emotionalTag) external onlyAdmin {
        bridge.push(BridgeEntry(_gameLabel, _bridgeClause, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        bridge[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (BridgeEntry memory) {
        return bridge[index];
    }
}
