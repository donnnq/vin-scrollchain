// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TentInflationAuditDAO {
    address public admin;

    struct TentEntry {
        string location;
        string supplySource; // "NGO", "Private Donor", "Self-Funded"
        string motiveTag; // "Shelter", "Visibility", "Incentive Trigger"
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    TentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTentAudit(string memory location, string memory supplySource, string memory motiveTag, string memory emotionalTag) external onlyAdmin {
        entries.push(TentEntry(location, supplySource, motiveTag, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealTentEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getTentEntry(uint256 index) external view returns (TentEntry memory) {
        return entries[index];
    }
}
