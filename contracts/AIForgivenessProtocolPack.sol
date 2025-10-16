// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIForgivenessProtocolPack {
    address public admin;

    struct ForgivenessEntry {
        string aiLabel;
        string displacedFunction;
        string emotionalTag;
        bool forgiven;
    }

    ForgivenessEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory aiLabel, string memory displacedFunction, string memory emotionalTag) external onlyAdmin {
        entries.push(ForgivenessEntry(aiLabel, displacedFunction, emotionalTag, false));
    }

    function markForgiven(uint256 index) external onlyAdmin {
        entries[index].forgiven = true;
    }

    function getEntry(uint256 index) external view returns (ForgivenessEntry memory) {
        return entries[index];
    }
}
