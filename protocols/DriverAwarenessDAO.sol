// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DriverAwarenessDAO {
    address public admin;

    struct AwarenessEntry {
        string route;
        string awarenessType; // "Jumper Risk", "Cargo Theft", "Youth Spotting"
        string awarenessClause;
        string emotionalTag;
        bool summoned;
        bool trained;
        bool sealed;
    }

    AwarenessEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAwareness(string memory route, string memory awarenessType, string memory awarenessClause, string memory emotionalTag) external onlyAdmin {
        entries.push(AwarenessEntry(route, awarenessType, awarenessClause, emotionalTag, true, false, false));
    }

    function confirmTraining(uint256 index) external onlyAdmin {
        entries[index].trained = true;
    }

    function sealAwarenessEntry(uint256 index) external onlyAdmin {
        require(entries[index].trained, "Must be trained first");
        entries[index].sealed = true;
    }

    function getAwarenessEntry(uint256 index) external view returns (AwarenessEntry memory) {
        return entries[index];
    }
}
