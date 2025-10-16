// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetarySurveillanceJusticeBroadcastDAO {
    address public admin;

    struct BroadcastEntry {
        string issueLabel;
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

    function submitEntry(string memory issueLabel, string memory broadcastMessage, string memory emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(issueLabel, broadcastMessage, emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
