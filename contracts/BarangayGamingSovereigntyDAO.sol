// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayGamingSovereigntyDAO {
    address public admin;

    struct SovereigntyEntry {
        string purokLabel;
        string gameTitle;
        string emotionalTag;
        bool deployed;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory purokLabel, string memory gameTitle, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(purokLabel, gameTitle, emotionalTag, false));
    }

    function deployEntry(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function getEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
