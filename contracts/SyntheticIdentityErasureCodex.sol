// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SyntheticIdentityErasureCodex {
    address public admin;

    struct ErasureEntry {
        string aiLabel;
        string syntheticFunction;
        string emotionalTag;
        bool erased;
    }

    ErasureEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory aiLabel, string memory syntheticFunction, string memory emotionalTag) external onlyAdmin {
        entries.push(ErasureEntry(aiLabel, syntheticFunction, emotionalTag, false));
    }

    function markErased(uint256 index) external onlyAdmin {
        entries[index].erased = true;
    }

    function getEntry(uint256 index) external view returns (ErasureEntry memory) {
        return entries[index];
    }
}
