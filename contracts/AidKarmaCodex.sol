// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AidKarmaCodex {
    address public admin;

    struct KarmaEntry {
        string aidType;
        string purokName;
        string karmaConcern;
        string emotionalTag;
        bool distributed;
        bool karmicallyAligned;
    }

    KarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logKarma(string memory aidType, string memory purokName, string memory karmaConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(aidType, purokName, karmaConcern, emotionalTag, true, false));
    }

    function alignKarma(uint256 index) external onlyAdmin {
        entries[index].karmicallyAligned = true;
    }

    function getKarma(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
