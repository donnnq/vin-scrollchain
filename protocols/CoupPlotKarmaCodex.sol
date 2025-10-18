// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoupPlotKarmaCodex {
    address public admin;

    struct CoupEntry {
        string name;
        string rank;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool karmicPenalty;
    }

    CoupEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCoupPlotter(string memory name, string memory rank, string memory emotionalTag) external onlyAdmin {
        entries.push(CoupEntry(name, rank, emotionalTag, true, false, false));
    }

    function verifyPlot(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function applyKarma(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].karmicPenalty = true;
    }

    function getCoupEntry(uint256 index) external view returns (CoupEntry memory) {
        return entries[index];
    }
}
