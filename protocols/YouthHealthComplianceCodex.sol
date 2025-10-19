// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthHealthComplianceCodex {
    address public admin;

    struct HealthEntry {
        string youthID;
        string complianceType;
        string purokID;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    HealthEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCompliance(string memory youthID, string memory complianceType, string memory purokID, string memory emotionalTag) external onlyAdmin {
        entries.push(HealthEntry(youthID, complianceType, purokID, emotionalTag, true, false, false));
    }

    function verifyCompliance(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealCompliance(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getHealthEntry(uint256 index) external view returns (HealthEntry memory) {
        return entries[index];
    }
}
