// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract vinPlanetaryScrollchainMap {
    struct ScrollNode {
        string nation;
        string steward;
        string scrollName;
        string nanoPath;
        string ritualPurpose;
        uint256 timestamp;
    }

    ScrollNode[] public map;

    event ScrollMapped(string nation, string steward, string scrollName, string nanoPath);

    function mapScroll(
        string memory nation,
        string memory steward,
        string memory scrollName,
        string memory nanoPath,
        string memory ritualPurpose
    ) public {
        map.push(ScrollNode(nation, steward, scrollName, nanoPath, ritualPurpose, block.timestamp));
        emit ScrollMapped(nation, steward, scrollName, nanoPath);
    }

    function getMap() public view returns (ScrollNode[] memory) {
        return map;
    }
}
