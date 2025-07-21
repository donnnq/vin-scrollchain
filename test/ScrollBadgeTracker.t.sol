// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../contracts/utils/ScrollBadgeMintStation.sol";

contract ScrollBadgeTrackerTest is Test {
    ScrollBadgeMintStation badgeStation;

    event BadgeMinted(address indexed deployer, uint256 indexed badgeId, string label);

    function setUp() public {
        badgeStation = new ScrollBadgeMintStation();
    }

    function testInitialBadgeIdsEmpty() public view {
        uint256[] memory badges = badgeStation.getBadgeIds(address(this));
        assertEq(badges.length, 0, "Expected no badges initially");
    }

    function testMintBadgeIncrementsCountAndLogs() public {
        // Expect the BadgeMinted event
        vm.expectEmit(true, true, true, true);
        emit BadgeMinted(address(this), 0, "FirstMission");

        badgeStation.mintBadge("FirstMission");

        // Check badgeCount increment
        assertEq(badgeStation.badgeCount(), 1, "Badge count should be 1");

        // Verify badge details
        (string memory label, uint256 ts, address deployer) = badgeStation.getBadgeDetails(0);
        assertEq(label, "FirstMission");
        assertEq(deployer, address(this));
        assertTrue(ts > 0, "Timestamp should be set");

        // Verify deployer’s badge list
        uint256[] memory badges = badgeStation.getBadgeIds(address(this));
        assertEq(badges.length, 1);
        assertEq(badges[0], 0);
    }

    function testMultipleMintingTracksAllBadges() public {
        badgeStation.mintBadge("MissionA");
        badgeStation.mintBadge("MissionB");
        badgeStation.mintBadge("MissionC");

        uint256[] memory badges = badgeStation.getBadgeIds(address(this));
        assertEq(badges.length, 3, "Should have 3 badges");
        assertEq(badges[0], 0);
        assertEq(badges[1], 1);
        assertEq(badges[2], 2);
    }
}
