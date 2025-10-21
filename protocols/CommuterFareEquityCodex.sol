// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommuterFareEquityCodex {
    address public admin;

    struct FareEntry {
        string commuterType;
        string fareRate;
        string equityClause;
        string emotionalTag;
        bool summoned;
        bool approved;
        bool sealed;
    }

    FareEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFare(string memory commuterType, string memory fareRate, string memory equityClause, string memory emotionalTag) external onlyAdmin {
        entries.push(FareEntry(commuterType, fareRate, equityClause, emotionalTag, true, false, false));
    }

    function confirmApproval(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function sealFareEntry(uint256 index) external onlyAdmin {
        require(entries[index].approved, "Must be approved first");
        entries[index].sealed = true;
    }

    function getFareEntry(uint256 index) external view returns (FareEntry memory) {
        return entries[index];
    }
}
