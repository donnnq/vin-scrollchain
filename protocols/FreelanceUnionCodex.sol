// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FreelanceUnionCodex {
    address public admin;

    struct UnionEntry {
        string platformName;
        string unionName;
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool organized;
        bool sealed;
    }

    UnionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonUnion(string memory platformName, string memory unionName, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(UnionEntry(platformName, unionName, codexClause, emotionalTag, true, false, false));
    }

    function confirmOrganization(uint256 index) external onlyAdmin {
        entries[index].organized = true;
    }

    function sealUnionEntry(uint256 index) external onlyAdmin {
        require(entries[index].organized, "Must be organized first");
        entries[index].sealed = true;
    }

    function getUnionEntry(uint256 index) external view returns (UnionEntry memory) {
        return entries[index];
    }
}
