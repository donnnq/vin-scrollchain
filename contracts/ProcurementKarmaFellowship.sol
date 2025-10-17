// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProcurementKarmaFellowship {
    address public admin;

    struct FellowshipEntry {
        string contractorName;
        string procurementTheme;
        string emotionalTag;
        bool summoned;
        bool completed;
    }

    FellowshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFellowship(string memory contractorName, string memory procurementTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(FellowshipEntry(contractorName, procurementTheme, emotionalTag, true, false));
    }

    function completeFellowship(uint256 index) external onlyAdmin {
        entries[index].completed = true;
    }

    function getFellowshipEntry(uint256 index) external view returns (FellowshipEntry memory) {
        return entries[index];
    }
}
