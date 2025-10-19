// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssetDiscrepancyLedgerDAO {
    address public admin;

    struct DiscrepancyEntry {
        string officialName;
        string year;
        string discrepancyType;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    DiscrepancyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDiscrepancy(string memory officialName, string memory year, string memory discrepancyType, string memory emotionalTag) external onlyAdmin {
        entries.push(DiscrepancyEntry(officialName, year, discrepancyType, emotionalTag, true, false, false));
    }

    function verifyDiscrepancy(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealDiscrepancy(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getDiscrepancyEntry(uint256 index) external view returns (DiscrepancyEntry memory) {
        return entries[index];
    }
}
