// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MilitaryLegacyAuditDAO {
    address public admin;

    struct OfficerEntry {
        string name;
        string rank;
        string emotionalTag;
        bool summoned;
        bool flagged;
        bool pensionRevoked;
    }

    OfficerEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOfficer(string memory name, string memory rank, string memory emotionalTag) external onlyAdmin {
        entries.push(OfficerEntry(name, rank, emotionalTag, true, false, false));
    }

    function flagForCoup(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function revokePension(uint256 index) external onlyAdmin {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].pensionRevoked = true;
    }

    function getOfficerEntry(uint256 index) external view returns (OfficerEntry memory) {
        return entries[index];
    }
}
