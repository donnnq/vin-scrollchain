// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TitleIXKarmaCodex {
    address public admin;

    struct KarmaEntry {
        string institution;
        string violationType;
        string emotionalTag;
        bool summoned;
        bool resolved;
    }

    KarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonViolation(string memory institution, string memory violationType, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(institution, violationType, emotionalTag, true, false));
    }

    function resolveViolation(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
