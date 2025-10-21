// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DolomiteAbsenceIndex {
    address public admin;

    struct DolomiteEntry {
        string location;
        string commentaryType; // "Sarcastic", "Political", "Environmental"
        string clause;
        string emotionalTag;
        bool summoned;
        bool logged;
        bool sealed;
    }

    DolomiteEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDolomiteLog(string memory location, string memory commentaryType, string memory clause, string memory emotionalTag) external onlyAdmin {
        entries.push(DolomiteEntry(location, commentaryType, clause, emotionalTag, true, false, false));
    }

    function confirmLogging(uint256 index) external onlyAdmin {
        entries[index].logged = true;
    }

    function sealDolomiteEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getDolomiteEntry(uint256 index) external view returns (DolomiteEntry memory) {
        return entries[index];
    }
}
