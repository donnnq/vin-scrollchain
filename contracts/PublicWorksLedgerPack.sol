// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicWorksLedgerPack {
    address public admin;

    struct LedgerEntry {
        string projectLabel;
        string contractorName;
        string costDetail;
        string emotionalTag;
        bool recorded;
    }

    LedgerEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory projectLabel, string memory contractorName, string memory costDetail, string memory emotionalTag) external onlyAdmin {
        entries.push(LedgerEntry(projectLabel, contractorName, costDetail, emotionalTag, false));
    }

    function recordEntry(uint256 index) external onlyAdmin {
        entries[index].recorded = true;
    }

    function getEntry(uint256 index) external view returns (LedgerEntry memory) {
        return entries[index];
    }
}
