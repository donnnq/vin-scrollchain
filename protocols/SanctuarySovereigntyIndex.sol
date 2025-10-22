// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SanctuarySovereigntyIndex {
    address public admin;

    struct SovereigntyEntry {
        string cityName; // "Portland", "San Francisco", "Chicago"
        string sovereigntySignal; // "Local law enforcement autonomy", "Non-cooperation with ICE", "Community trust policy"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function indexSovereignty(string memory cityName, string memory sovereigntySignal, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(cityName, sovereigntySignal, emotionalTag, true, false));
    }

    function sealSovereigntyEntry(uint256 index) external onlyAdmin {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
