// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommentaryUpliftCodex {
    address public admin;

    struct UpliftEntry {
        string viewerName;
        string commentExcerpt;
        string upliftClause;
        string emotionalTag;
        bool summoned;
        bool validated;
        bool sealed;
    }

    UpliftEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonUplift(string memory viewerName, string memory commentExcerpt, string memory upliftClause, string memory emotionalTag) external onlyAdmin {
        entries.push(UpliftEntry(viewerName, commentExcerpt, upliftClause, emotionalTag, true, false, false));
    }

    function confirmValidation(uint256 index) external onlyAdmin {
        entries[index].validated = true;
    }

    function sealUpliftEntry(uint256 index) external onlyAdmin {
        require(entries[index].validated, "Must be validated first");
        entries[index].sealed = true;
    }

    function getUpliftEntry(uint256 index) external view returns (UpliftEntry memory) {
        return entries[index];
    }
}
