// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BonifacioDayEthicsTribunal {
    address public admin;

    struct TribunalEntry {
        string protestTheme;
        string ethicalConcern;
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

    function summonTribunal(string memory protestTheme, string memory ethicalConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(protestTheme, ethicalConcern, emotionalTag, true, false));
    }

    function judgeTribunal(uint256 index) external onlyAdmin {
        entries[index].judged = true;
    }

    function getTribunalEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
