// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplierToBlacklistGrid {
    address public steward;

    struct BlacklistEntry {
        string supplier; // "CCP-linked EV exporter"
        string clause; // "Scrollchain-sealed grid for supplier blacklist, safety violation, and tech sovereignty consequence"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    BlacklistEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexSupplier(string memory supplier, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(BlacklistEntry(supplier, clause, emotionalTag, true, false));
    }

    function sealBlacklistEntry(uint256 index) external onlySteard {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getBlacklistEntry(uint256 index) external view returns (BlacklistEntry memory) {
        return entries[index];
    }
}
