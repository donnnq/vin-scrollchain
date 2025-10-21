// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalFintechDignityProtocol {
    address public admin;

    struct DignityEntry {
        string eventName;
        string fintechTheme;
        string dignityClause;
        string emotionalTag;
        bool summoned;
        bool celebrated;
        bool sealed;
    }

    DignityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDignity(string memory eventName, string memory fintechTheme, string memory dignityClause, string memory emotionalTag) external onlyAdmin {
        entries.push(DignityEntry(eventName, fintechTheme, dignityClause, emotionalTag, true, false, false));
    }

    function confirmCelebration(uint256 index) external onlyAdmin {
        entries[index].celebrated = true;
    }

    function sealDignityEntry(uint256 index) external onlyAdmin {
        require(entries[index].celebrated, "Must be celebrated first");
        entries[index].sealed = true;
    }

    function getDignityEntry(uint256 index) external view returns (DignityEntry memory) {
        return entries[index];
    }
}
