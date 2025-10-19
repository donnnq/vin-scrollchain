// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KapusoHousingAuditDAO {
    address public admin;

    struct AuditEntry {
        string location;
        string mediaEpisode;
        string housingType;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAudit(string memory location, string memory mediaEpisode, string memory housingType, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(location, mediaEpisode, housingType, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealAuditEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getAuditEntry(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
