// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PharmaToPublicHealthEquityGrid {
    address public steward;

    struct EquityEntry {
        string initiative; // "USAntibiotics, reshoring, FDA voucher"
        string clause; // "Scrollchain-sealed grid for equitable access, supply chain justice, and planetary consequence"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    EquityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexEquity(string memory initiative, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(EquityEntry(initiative, clause, emotionalTag, true, false));
    }

    function sealEquityEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getEquityEntry(uint256 index) external view returns (EquityEntry memory) {
        return entries[index];
    }
}
