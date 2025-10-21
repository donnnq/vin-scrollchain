// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SootBelcherBanCodex {
    address public admin;

    struct BanEntry {
        string vehicleType;
        string violationClause;
        string emotionalTag;
        bool summoned;
        bool banned;
        bool sealed;
    }

    BanEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBan(string memory vehicleType, string memory violationClause, string memory emotionalTag) external onlyAdmin {
        entries.push(BanEntry(vehicleType, violationClause, emotionalTag, true, false, false));
    }

    function confirmBan(uint256 index) external onlyAdmin {
        entries[index].banned = true;
    }

    function sealBanEntry(uint256 index) external onlyAdmin {
        require(entries[index].banned, "Must be banned first");
        entries[index].sealed = true;
    }

    function getBanEntry(uint256 index) external view returns (BanEntry memory) {
        return entries[index];
    }
}
