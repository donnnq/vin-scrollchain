// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureBroadcastCodex {
    address public admin;

    struct BroadcastEntry {
        string projectLabel;
        string broadcastMessage;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory projectLabel, string memory broadcastMessage, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(projectLabel, broadcastMessage, emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
