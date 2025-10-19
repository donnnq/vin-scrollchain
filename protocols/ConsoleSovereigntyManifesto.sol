// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConsoleSovereigntyManifesto {
    address public admin;

    struct ManifestoEntry {
        string principle;
        string justification;
        string emotionalTag;
        bool summoned;
        bool endorsed;
        bool sealed;
    }

    ManifestoEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPrinciple(string memory principle, string memory justification, string memory emotionalTag) external onlyAdmin {
        entries.push(ManifestoEntry(principle, justification, emotionalTag, true, false, false));
    }

    function confirmEndorsement(uint256 index) external onlyAdmin {
        entries[index].endorsed = true;
    }

    function sealManifestoEntry(uint256 index) external onlyAdmin {
        require(entries[index].endorsed, "Must be endorsed first");
        entries[index].sealed = true;
    }

    function getManifestoEntry(uint256 index) external view returns (ManifestoEntry memory) {
        return entries[index];
    }
}
