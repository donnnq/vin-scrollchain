// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract QRMenuToDigitalAccessGrid {
    address public steward;

    struct AccessEntry {
        string booth; // "Fishball Queen, Kakanin Master"
        string clause; // "Scrollchain-sealed grid for QR menu access, tech dignity, and contactless nourishment"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    AccessEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexAccess(string memory booth, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(AccessEntry(booth, clause, emotionalTag, true, false));
    }

    function sealAccessEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getAccessEntry(uint256 index) external view returns (AccessEntry memory) {
        return entries[index];
    }
}
