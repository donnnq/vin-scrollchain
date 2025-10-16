// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EconomicJusticeBroadcastPack {
    address public admin;

    struct BroadcastEntry {
        string injusticeLabel;
        string justiceMessage;
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

    function submitEntry(string memory injusticeLabel, string memory justiceMessage, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(injusticeLabel, justiceMessage, emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
