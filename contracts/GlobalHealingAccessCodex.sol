// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalHealingAccessCodex {
    address public admin;

    struct AccessEntry {
        string drugName;
        string region;
        string emotionalTag;
        bool summoned;
        bool granted;
    }

    AccessEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAccess(string memory drugName, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(AccessEntry(drugName, region, emotionalTag, true, false));
    }

    function grantAccess(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function getAccessEntry(uint256 index) external view returns (AccessEntry memory) {
        return entries[index];
    }
}
