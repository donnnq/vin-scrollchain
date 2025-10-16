// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultilingualAccessBroadcastPack {
    address public admin;

    struct LanguageBroadcast {
        string regionLabel;
        string languageUsed;
        string broadcastPurpose;
        string emotionalTag;
        bool aired;
    }

    LanguageBroadcast[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory regionLabel, string memory languageUsed, string memory broadcastPurpose, string memory emotionalTag) external onlyAdmin {
        broadcasts.push(LanguageBroadcast(regionLabel, languageUsed, broadcastPurpose, emotionalTag, false));
    }

    function airBroadcast(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (LanguageBroadcast memory) {
        return broadcasts[index];
    }
}
