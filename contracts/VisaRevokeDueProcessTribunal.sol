// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VisaRevokeDueProcessTribunal {
    address public admin;

    struct TribunalEntry {
        string migrantName;
        string visaType;
        string emotionalTag;
        bool summoned;
        bool cleared;
    }

    TribunalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTribunal(string memory migrantName, string memory visaType, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(migrantName, visaType, emotionalTag, true, false));
    }

    function clearTribunal(uint256 index) external onlyAdmin {
        entries[index].cleared = true;
    }

    function getTribunalEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
