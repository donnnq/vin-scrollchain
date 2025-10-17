// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TelecomBreachKarmaDAO {
    address public admin;

    struct BreachEntry {
        string telecomName;
        string breachType;
        string emotionalTag;
        bool summoned;
        bool resolved;
    }

    BreachEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBreach(string memory telecomName, string memory breachType, string memory emotionalTag) external onlyAdmin {
        entries.push(BreachEntry(telecomName, breachType, emotionalTag, true, false));
    }

    function resolveBreach(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getBreach(uint256 index) external view returns (BreachEntry memory) {
        return entries[index];
    }
}
