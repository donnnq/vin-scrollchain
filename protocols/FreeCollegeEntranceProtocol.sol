// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FreeCollegeEntranceProtocol {
    address public admin;

    struct EntranceEntry {
        string youthID;
        string examCenter;
        string barangayName;
        string emotionalTag;
        bool summoned;
        bool scheduled;
        bool sealed;
    }

    EntranceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEntrance(string memory youthID, string memory examCenter, string memory barangayName, string memory emotionalTag) external onlyAdmin {
        entries.push(EntranceEntry(youthID, examCenter, barangayName, emotionalTag, true, false, false));
    }

    function scheduleEntrance(uint256 index) external onlyAdmin {
        entries[index].scheduled = true;
    }

    function sealEntrance(uint256 index) external onlyAdmin {
        require(entries[index].scheduled, "Must be scheduled first");
        entries[index].sealed = true;
    }

    function getEntranceEntry(uint256 index) external view returns (EntranceEntry memory) {
        return entries[index];
    }
}
