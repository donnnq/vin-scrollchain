// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicFigureReputationLedger {
    address public admin;

    struct ReputationEntry {
        string figureName;
        string attackType;
        string emotionalTag;
        bool summoned;
        bool defended;
    }

    ReputationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDefense(string memory figureName, string memory attackType, string memory emotionalTag) external onlyAdmin {
        entries.push(ReputationEntry(figureName, attackType, emotionalTag, true, false));
    }

    function defendFigure(uint256 index) external onlyAdmin {
        entries[index].defended = true;
    }

    function getReputationEntry(uint256 index) external view returns (ReputationEntry memory) {
        return entries[index];
    }
}
