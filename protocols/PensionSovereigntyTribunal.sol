// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PensionSovereigntyTribunal {
    address public admin;

    struct PensionEntry {
        string name;
        string rank;
        string emotionalTag;
        bool summoned;
        bool underReview;
        bool revoked;
    }

    PensionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReview(string memory name, string memory rank, string memory emotionalTag) external onlyAdmin {
        entries.push(PensionEntry(name, rank, emotionalTag, true, false, false));
    }

    function markUnderReview(uint256 index) external onlyAdmin {
        entries[index].underReview = true;
    }

    function revokePension(uint256 index) external onlyAdmin {
        require(entries[index].underReview, "Must be under review first");
        entries[index].revoked = true;
    }

    function getPensionEntry(uint256 index) external view returns (PensionEntry memory) {
        return entries[index];
    }
}
