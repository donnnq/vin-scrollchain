// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecondAmendmentDAO {
    address public admin;

    struct AmendmentEntry {
        string caseName;
        string clauseContested;
        string emotionalTag;
        bool summoned;
        bool heard;
        bool sealed;
    }

    AmendmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCase(string memory caseName, string memory clauseContested, string memory emotionalTag) external onlyAdmin {
        entries.push(AmendmentEntry(caseName, clauseContested, emotionalTag, true, false, false));
    }

    function confirmHearing(uint256 index) external onlyAdmin {
        entries[index].heard = true;
    }

    function sealAmendmentEntry(uint256 index) external onlyAdmin {
        require(entries[index].heard, "Must be heard first");
        entries[index].sealed = true;
    }

    function getAmendmentEntry(uint256 index) external view returns (AmendmentEntry memory) {
        return entries[index];
    }
}
