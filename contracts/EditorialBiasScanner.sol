// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EditorialBiasScanner {
    address public admin;

    struct BiasEntry {
        string outletName;
        string biasType;
        string emotionalTag;
        bool flagged;
        bool reviewed;
    }

    BiasEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function flagBias(string memory outletName, string memory biasType, string memory emotionalTag) external onlyAdmin {
        entries.push(BiasEntry(outletName, biasType, emotionalTag, true, false));
    }

    function reviewBias(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function getBiasEntry(uint256 index) external view returns (BiasEntry memory) {
        return entries[index];
    }
}
