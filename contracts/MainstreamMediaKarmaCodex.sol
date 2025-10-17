// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MainstreamMediaKarmaCodex {
    address public admin;

    struct KarmaEntry {
        string networkName;
        string civicBreach;
        string emotionalTag;
        bool archived;
        bool exposed;
    }

    KarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function archiveBreach(string memory networkName, string memory civicBreach, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(networkName, civicBreach, emotionalTag, true, false));
    }

    function exposeBreach(uint256 index) external onlyAdmin {
        entries[index].exposed = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
