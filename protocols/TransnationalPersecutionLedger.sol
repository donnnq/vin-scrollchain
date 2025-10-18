// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransnationalPersecutionLedger {
    address public admin;

    struct PersecutionEntry {
        string group;
        string location;
        string method;
        string emotionalTag;
        bool summoned;
        bool documented;
        bool submittedToGlobalTribunal;
    }

    PersecutionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPersecution(string memory group, string memory location, string memory method, string memory emotionalTag) external onlyAdmin {
        entries.push(PersecutionEntry(group, location, method, emotionalTag, true, false, false));
    }

    function documentPersecution(uint256 index) external onlyAdmin {
        entries[index].documented = true;
    }

    function submitToTribunal(uint256 index) external onlyAdmin {
        require(entries[index].documented, "Must be documented first");
        entries[index].submittedToGlobalTribunal = true;
    }

    function getPersecutionEntry(uint256 index) external view returns (PersecutionEntry memory) {
        return entries[index];
    }
}
