// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MediaEthicsTribunal {
    address public admin;

    struct TribunalEntry {
        string networkName;
        string ethicsConcern;
        string emotionalTag;
        bool summoned;
        bool resolved;
    }

    TribunalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTribunal(string memory networkName, string memory ethicsConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(networkName, ethicsConcern, emotionalTag, true, false));
    }

    function resolveTribunal(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getTribunalEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
