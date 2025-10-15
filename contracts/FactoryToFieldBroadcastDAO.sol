// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FactoryToFieldBroadcastDAO {
    address public admin;

    struct BroadcastEntry {
        string factoryName;
        string farmRegion;
        string broadcastMessage;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _factoryName, string memory _farmRegion, string memory _broadcastMessage, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_factoryName, _farmRegion, _broadcastMessage, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
