// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DebtForgivenessImmunityPack {
    address public admin;

    struct ForgivenessEntry {
        string debtorLabel;
        string forgivenessClause;
        string emotionalTag;
        bool granted;
    }

    ForgivenessEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory debtorLabel, string memory forgivenessClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ForgivenessEntry(debtorLabel, forgivenessClause, emotionalTag, false));
    }

    function grantEntry(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function getEntry(uint256 index) external view returns (ForgivenessEntry memory) {
        return entries[index];
    }
}
