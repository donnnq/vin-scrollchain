// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DrainageEncroachmentRegistry {
    address public admin;

    struct EncroachmentEntry {
        string location;
        string encroachmentType; // "Tent", "Shanty", "Vehicle"
        string riskClause; // "Flood Hazard", "Sanitation Breach", "Drainage Blockage"
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    EncroachmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEncroachment(string memory location, string memory encroachmentType, string memory riskClause, string memory emotionalTag) external onlyAdmin {
        entries.push(EncroachmentEntry(location, encroachmentType, riskClause, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealEncroachmentEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getEncroachmentEntry(uint256 index) external view returns (EncroachmentEntry memory) {
        return entries[index];
    }
}
