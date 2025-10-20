// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RestitutionAndRedemptionCodex {
    address public admin;

    struct RedemptionEntry {
        string offenderName;
        string restitutionPath;
        string redemptionClause;
        string emotionalTag;
        bool summoned;
        bool initiated;
        bool sealed;
    }

    RedemptionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRedemption(string memory offenderName, string memory restitutionPath, string memory redemptionClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RedemptionEntry(offenderName, restitutionPath, redemptionClause, emotionalTag, true, false, false));
    }

    function confirmInitiation(uint256 index) external onlyAdmin {
        entries[index].initiated = true;
    }

    function sealRedemptionEntry(uint256 index) external onlyAdmin {
        require(entries[index].initiated, "Must be initiated first");
        entries[index].sealed = true;
    }

    function getRedemptionEntry(uint256 index) external view returns (RedemptionEntry memory) {
        return entries[index];
    }
}
