// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateDiversionDetectionPack {
    address public admin;

    struct DiversionEntry {
        string originalTarget;
        string diversionTopic;
        string emotionalTag;
        bool detected;
        bool exposed;
    }

    DiversionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitDiversion(string memory originalTarget, string memory diversionTopic, string memory emotionalTag) external onlyAdmin {
        entries.push(DiversionEntry(originalTarget, diversionTopic, emotionalTag, false, false));
    }

    function detectDiversion(uint256 index) external onlyAdmin {
        entries[index].detected = true;
    }

    function exposeDiversion(uint256 index) external onlyAdmin {
        entries[index].exposed = true;
    }

    function getDiversion(uint256 index) external view returns (DiversionEntry memory) {
        return entries[index];
    }
}
