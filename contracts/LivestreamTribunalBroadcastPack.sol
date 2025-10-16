// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LivestreamTribunalBroadcastPack {
    address public admin;

    struct BroadcastSession {
        string tribunalLabel;
        string streamLink;
        string emotionalTag;
        bool aired;
    }

    BroadcastSession[] public sessions;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitSession(string memory tribunalLabel, string memory streamLink, string memory emotionalTag) external onlyAdmin {
        sessions.push(BroadcastSession(tribunalLabel, streamLink, emotionalTag, false));
    }

    function airSession(uint256 index) external onlyAdmin {
        sessions[index].aired = true;
    }

    function getSession(uint256 index) external view returns (BroadcastSession memory) {
        return sessions[index];
    }
}
