// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RefugeeDignityCodex {
    address public admin;

    struct RefugeeEntry {
        string name;
        string originCountry;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    RefugeeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRefugee(string memory name, string memory originCountry, string memory emotionalTag) external onlyAdmin {
        entries.push(RefugeeEntry(name, originCountry, emotionalTag, true, false, false));
    }

    function protectRefugee(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealDignity(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getRefugeeEntry(uint256 index) external view returns (RefugeeEntry memory) {
        return entries[index];
    }
}
