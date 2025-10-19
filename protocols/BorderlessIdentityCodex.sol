// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BorderlessIdentityCodex {
    address public admin;

    struct IdentityEntry {
        string alias;
        string corridor;
        string emotionalTag;
        bool summoned;
        bool validated;
        bool sealed;
    }

    IdentityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonIdentity(string memory alias, string memory corridor, string memory emotionalTag) external onlyAdmin {
        entries.push(IdentityEntry(alias, corridor, emotionalTag, true, false, false));
    }

    function validateIdentity(uint256 index) external onlyAdmin {
        entries[index].validated = true;
    }

    function sealIdentity(uint256 index) external onlyAdmin {
        require(entries[index].validated, "Must be validated first");
        entries[index].sealed = true;
    }

    function getIdentityEntry(uint256 index) external view returns (IdentityEntry memory) {
        return entries[index];
    }
}
