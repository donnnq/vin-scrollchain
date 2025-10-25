// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaToRestorationFundProtocol {
    address public steward;

    struct FundEntry {
        string contactRegion; // "United States"
        string migrantStatus; // "Legal resident", "Naturalized citizen"
        string role; // "Disburs officer", "Community steward"
        string supportType; // "Livelihood aid", "Civic education", "Silent protest logistics"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    FundEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployFund(string memory contactRegion, string memory migrantStatus, string memory role, string memory supportType, string memory emotionalTag) external onlySteward {
        entries.push(FundEntry(contactRegion, migrantStatus, role, supportType, emotionalTag, true, false));
    }

    function sealFundEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getFundEntry(uint256 index) external view returns (FundEntry memory) {
        return entries[index];
    }
}
