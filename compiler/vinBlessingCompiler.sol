// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract vinBlessingCompiler {
    struct LinkedScroll {
        string scrollName;
        string nanoPath;
        string steward;
        string purpose;
        uint256 timestamp;
    }

    LinkedScroll[] public dashboard;

    event ScrollLinked(string scrollName, string nanoPath, string steward, string purpose);

    function linkScroll(
        string memory scrollName,
        string memory nanoPath,
        string memory steward,
        string memory purpose
    ) public {
        dashboard.push(LinkedScroll(scrollName, nanoPath, steward, purpose, block.timestamp));
        emit ScrollLinked(scrollName, nanoPath, steward, purpose);
    }

    function getDashboard() public view returns (LinkedScroll[] memory) {
        return dashboard;
    }
}
