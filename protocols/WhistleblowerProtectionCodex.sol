// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WhistleblowerProtectionCodex {
    address public admin;

    struct ProtectionEntry {
        string whistleblowerName;
        string disclosureType;
        string agencyInvolved;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    ProtectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProtection(string memory whistleblowerName, string memory disclosureType, string memory agencyInvolved, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtectionEntry(whistleblowerName, disclosureType, agencyInvolved, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealProtectionEntry(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getProtectionEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
