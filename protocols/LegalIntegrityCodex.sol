// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegalIntegrityCodex {
    address public admin;

    struct LegalEntry {
        string official;
        string caseName;
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool sealed;
    }

    LegalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLegalReview(string memory official, string memory caseName, string memory emotionalTag) external onlyAdmin {
        entries.push(LegalEntry(official, caseName, emotionalTag, true, false, false));
    }

    function reviewLegalEntry(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealLegalEntry(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getLegalEntry(uint256 index) external view returns (LegalEntry memory) {
        return entries[index];
    }
}
