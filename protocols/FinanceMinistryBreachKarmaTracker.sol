// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FinanceMinistryBreachKarmaTracker {
    address public admin;

    struct BreachEntry {
        string ministry;
        string country;
        string malwareUsed;
        string emotionalTag;
        bool summoned;
        bool tagged;
        bool sealed;
    }

    BreachEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBreach(string memory ministry, string memory country, string memory malwareUsed, string memory emotionalTag) external onlyAdmin {
        entries.push(BreachEntry(ministry, country, malwareUsed, emotionalTag, true, false, false));
    }

    function tagBreach(uint256 index) external onlyAdmin {
        entries[index].tagged = true;
    }

    function sealBreach(uint256 index) external onlyAdmin {
        require(entries[index].tagged, "Must be tagged first");
        entries[index].sealed = true;
    }

    function getBreachEntry(uint256 index) external view returns (BreachEntry memory) {
        return entries[index];
    }
}
