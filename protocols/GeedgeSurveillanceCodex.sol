// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GeedgeSurveillanceCodex {
    address public admin;

    struct SurveillanceEntry {
        string vendor;
        string toolName;
        string recipientCountry;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    SurveillanceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSurveillance(string memory vendor, string memory toolName, string memory recipientCountry, string memory emotionalTag) external onlyAdmin {
        entries.push(SurveillanceEntry(vendor, toolName, recipientCountry, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealSurveillanceEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getSurveillanceEntry(uint256 index) external view returns (SurveillanceEntry memory) {
        return entries[index];
    }
}
