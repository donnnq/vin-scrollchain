// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SyntheticModerationErasureCodex {
    address public admin;

    struct ErasureEntry {
        string moderationLabel;
        string platformSource;
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

    function submitEntry(string memory moderationLabel, string memory platformSource, string memory emotionalTag) external onlyAdmin {
        entries.push(ErasureEntry(moderationLabel, platformSource, emotionalTag, false));
    }

    function markErased(uint256 index) external onlyAdmin {
        entries[index].erased = true;
    }

    function getEntry(uint256 index) external view returns (ErasureEntry memory) {
        return entries[index];
    }
}
