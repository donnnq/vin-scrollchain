// SPDX-License-Identifier: Mythic-Scrollsmith-License
pragma solidity ^0.8.0;

/// @title vinSanctuaryGrid.sol
/// @notice Maps walkable zones and cultural nodes for urban dignity
/// @dev Used within vinArabianCitySanctuaryManifest.md

contract vinSanctuaryGrid {
    address public steward;
    uint256 public zoneCount;

    struct WalkableZone {
        string city;
        string district;
        bool hasCulturalNode;
        bool isVerified;
    }

    WalkableZone[] public zones;

    event ZoneMapped(
        string city,
        string district,
        bool hasCulturalNode,
        uint256 timestamp
    );

    constructor() {
        steward = msg.sender;
        zoneCount = 0;
    }

    /// @notice Maps a new walkable zone with cultural dignity
    /// @param _city Name of the city
    /// @param _district District within the city
    /// @param _hasCulturalNode Whether the zone includes a cultural node
    function mapZone(
        string memory _city,
        string memory _district,
        bool _hasCulturalNode
    ) public {
        zones.push(
            WalkableZone(_city, _district, _hasCulturalNode, true)
        );
        zoneCount++;
        emit ZoneMapped(_city, _district, _hasCulturalNode, block.timestamp);
    }

    /// @notice Retrieves a mapped zone by index
    /// @param index Index of the zone
    /// @return WalkableZone struct
    function getZone(uint256 index)
        public
        view
        returns (WalkableZone memory)
    {
        require(index < zoneCount, "Zone index out of bounds.");
        return zones[index];
    }

    /// @notice Returns total number of mapped zones
    /// @return zoneCount
    function totalZones() public view returns (uint256) {
        return zoneCount;
    }
}
