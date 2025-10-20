// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ThreatDesignationProtocolDAO {
    address public admin;

    struct DesignationEntry {
        string country;
        string designationStatus;
        string legalImpact;
        string emotionalTag;
        bool summoned;
        bool confirmed;
        bool sealed;
    }

    DesignationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDesignation(string memory country, string memory designationStatus, string memory legalImpact, string memory emotionalTag) external onlyAdmin {
        entries.push(DesignationEntry(country, designationStatus, legalImpact, emotionalTag, true, false, false));
    }

    function confirmDesignation(uint256 index) external onlyAdmin {
        entries[index].confirmed = true;
    }

    function sealDesignationEntry(uint256 index) external onlyAdmin {
        require(entries[index].confirmed, "Must be confirmed first");
        entries[index].sealed = true;
    }

    function getDesignationEntry(uint256 index) external view returns (DesignationEntry memory) {
        return entries[index];
    }
}
