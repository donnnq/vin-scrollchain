// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LifestyleCheckCodex {
    address public admin;

    struct LifestyleEntry {
        string officialName;
        string auditTrigger;
        string discrepancyType;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    LifestyleEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLifestyleCheck(string memory officialName, string memory auditTrigger, string memory discrepancyType, string memory emotionalTag) external onlyAdmin {
        entries.push(LifestyleEntry(officialName, auditTrigger, discrepancyType, emotionalTag, true, false, false));
    }

    function verifyLifestyle(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealLifestyle(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getLifestyleEntry(uint256 index) external view returns (LifestyleEntry memory) {
        return entries[index];
    }
}
