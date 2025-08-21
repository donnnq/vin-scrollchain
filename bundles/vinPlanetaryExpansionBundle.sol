// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract vinPlanetaryExpansionBundle {
    struct ExpansionScroll {
        string scrollName;
        string nanoPath;
        string steward;
        string ritualFunction;
        uint256 timestamp;
    }

    ExpansionScroll[] public bundle;

    event ScrollBundled(string scrollName, string steward, string ritualFunction);

    function bundleScroll(
        string memory scrollName,
        string memory nanoPath,
        string memory steward,
        string memory ritualFunction
    ) public {
        bundle.push(ExpansionScroll(scrollName, nanoPath, steward, ritualFunction, block.timestamp));
        emit ScrollBundled(scrollName, steward, ritualFunction);
    }

    function getBundle() public view returns (ExpansionScroll[] memory) {
        return bundle;
    }
}
