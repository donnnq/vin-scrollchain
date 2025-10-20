// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RealEstateDisruptionCodex {
    address public admin;

    struct DisruptionEntry {
        string disruptorName;
        string disruptionType;
        string impactRegion;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    DisruptionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDisruption(string memory disruptorName, string memory disruptionType, string memory impactRegion, string memory emotionalTag) external onlyAdmin {
        entries.push(DisruptionEntry(disruptorName, disruptionType, impactRegion, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealDisruptionEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getDisruptionEntry(uint256 index) external view returns (DisruptionEntry memory) {
        return entries[index];
    }
}
