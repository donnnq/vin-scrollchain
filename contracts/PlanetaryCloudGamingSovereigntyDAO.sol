// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryCloudGamingSovereigntyDAO {
    address public admin;

    struct SovereigntyEntry {
        string allianceLabel;
        string gameTitle;
        string emotionalTag;
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

    function submitEntry(string memory allianceLabel, string memory gameTitle, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(allianceLabel, gameTitle, emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        entries[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
