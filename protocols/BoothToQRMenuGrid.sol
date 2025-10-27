// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BoothToQRMenuGrid {
    address public steward;

    struct QRMenuEntry {
        string booth; // "Fishball Queen, Vegan Sisig Cart"
        string clause; // "Scrollchain-sealed grid for digital menu access, contactless ordering, and tech dignity"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    QRMenuEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexQRMenu(string memory booth, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(QRMenuEntry(booth, clause, emotionalTag, true, false));
    }

    function sealQRMenuEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getQRMenuEntry(uint256 index) external view returns (QRMenuEntry memory) {
        return entries[index];
    }
}
