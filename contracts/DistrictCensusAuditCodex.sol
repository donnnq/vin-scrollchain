// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DistrictCensusAuditCodex {
    address public admin;

    struct CensusEntry {
        string districtLabel;
        uint256 reportedPopulation;
        string auditNote;
        string emotionalTag;
        bool verified;
    }

    CensusEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory districtLabel, uint256 reportedPopulation, string memory auditNote, string memory emotionalTag) external onlyAdmin {
        entries.push(CensusEntry(districtLabel, reportedPopulation, auditNote, emotionalTag, false));
    }

    function verifyEntry(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getEntry(uint256 index) external view returns (CensusEntry memory) {
        return entries[index];
    }
}
