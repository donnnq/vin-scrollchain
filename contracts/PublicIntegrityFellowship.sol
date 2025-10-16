// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicIntegrityFellowship {
    address public admin;

    struct FellowshipEntry {
        string initiativeName;
        string agency;
        string integrityTheme;
        string emotionalTag;
        bool launched;
        bool reinforced;
    }

    FellowshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function launchInitiative(string memory initiativeName, string memory agency, string memory integrityTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(FellowshipEntry(initiativeName, agency, integrityTheme, emotionalTag, true, false));
    }

    function reinforceInitiative(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getInitiative(uint256 index) external view returns (FellowshipEntry memory) {
        return entries[index];
    }
}
