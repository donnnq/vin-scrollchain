// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PresidentialEscortEthicsTribunal {
    address public admin;

    struct TribunalEntry {
        string escortUnit;
        string ethicsConcern;
        string emotionalTag;
        bool summoned;
        bool judged;
    }

    TribunalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTribunal(string memory escortUnit, string memory ethicsConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(escortUnit, ethicsConcern, emotionalTag, true, false));
    }

    function judgeTribunal(uint256 index) external onlyAdmin {
        entries[index].judged = true;
    }

    function getTribunalEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
