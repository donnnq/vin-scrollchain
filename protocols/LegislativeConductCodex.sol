// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegislativeConductCodex {
    address public admin;

    struct ConductEntry {
        string memberName;
        string chamber;
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool sealed;
    }

    ConductEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonConduct(string memory memberName, string memory chamber, string memory emotionalTag) external onlyAdmin {
        entries.push(ConductEntry(memberName, chamber, emotionalTag, true, false, false));
    }

    function reviewConduct(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealConduct(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getConductEntry(uint256 index) external view returns (ConductEntry memory) {
        return entries[index];
    }
}
