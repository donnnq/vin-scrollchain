// SPDX-License-Identifier: Ritual-Reforestation
pragma solidity ^0.8.19;

/// @title SanctumReforestationDeck
/// @notice Automates tree planting rituals and ecosystem restoration

contract SanctumReforestationDeck {
    address public steward;

    struct ReforestationSite {
        string location;
        string biome;
        uint256 treesPlanted;
        string ritualProtocol;
    }

    mapping(string => ReforestationSite) public sanctumSites;
    string[] public siteKeys;

    event SiteRegistered(string location, string biome);
    event TreesPlanted(string location, uint256 count, string ritualProtocol);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function registerSite(
        string memory key,
        string memory location,
        string memory biome,
        string memory ritualProtocol
    ) external onlySteward {
        sanctumSites[key] = ReforestationSite(location, biome, 0, ritualProtocol);
        siteKeys.push(key);
        emit SiteRegistered(location, biome);
    }

    function plantTrees(string memory key, uint256 count) external onlySteward {
        sanctumSites[key].treesPlanted += count;
        emit TreesPlanted(sanctumSites[key].location, count, sanctumSites[key].ritualProtocol);
    }

    function getSite(string memory key) external view returns (ReforestationSite memory) {
        return sanctumSites[key];
    }
}
