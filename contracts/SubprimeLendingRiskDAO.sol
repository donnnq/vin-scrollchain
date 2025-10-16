// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SubprimeLendingRiskDAO {
    address public admin;

    struct RiskEntry {
        string lenderLabel;
        string riskType;
        string emotionalTag;
        bool flagged;
    }

    RiskEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory lenderLabel, string memory riskType, string memory emotionalTag) external onlyAdmin {
        entries.push(RiskEntry(lenderLabel, riskType, emotionalTag, false));
    }

    function flagEntry(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function getEntry(uint256 index) external view returns (RiskEntry memory) {
        return entries[index];
    }
}
