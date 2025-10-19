// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PDLRehabilitationSovereigntyCodex {
    address public admin;

    struct RehabEntry {
        string pdlName;
        string facilityName;
        string programType;
        string emotionalTag;
        bool summoned;
        bool enrolled;
        bool sealed;
    }

    RehabEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRehabProgram(string memory pdlName, string memory facilityName, string memory programType, string memory emotionalTag) external onlyAdmin {
        entries.push(RehabEntry(pdlName, facilityName, programType, emotionalTag, true, false, false));
    }

    function confirmEnrollment(uint256 index) external onlyAdmin {
        entries[index].enrolled = true;
    }

    function sealRehabEntry(uint256 index) external onlyAdmin {
        require(entries[index].enrolled, "Must be enrolled first");
        entries[index].sealed = true;
    }

    function getRehabEntry(uint256 index) external view returns (RehabEntry memory) {
        return entries[index];
    }
}
