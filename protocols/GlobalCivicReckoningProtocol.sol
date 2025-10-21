// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalCivicReckoningProtocol {
    address public admin;

    struct ReckoningEntry {
        string eventName;
        string civicTheme;
        string reckoningClause;
        string emotionalTag;
        bool summoned;
        bool debated;
        bool sealed;
    }

    ReckoningEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReckoning(string memory eventName, string memory civicTheme, string memory reckoningClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ReckoningEntry(eventName, civicTheme, reckoningClause, emotionalTag, true, false, false));
    }

    function confirmDebate(uint256 index) external onlyAdmin {
        entries[index].debated = true;
    }

    function sealReckoningEntry(uint256 index) external onlyAdmin {
        require(entries[index].debated, "Must be debated first");
        entries[index].sealed = true;
    }

    function getReckoningEntry(uint256 index) external view returns (ReckoningEntry memory) {
        return entries[index];
    }
}
