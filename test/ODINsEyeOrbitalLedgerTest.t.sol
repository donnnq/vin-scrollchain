// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Test.sol";
import "../contracts/global/ODINsEyeOrbitalLedger.sol";

contract ODINsEyeOrbitalLedgerTest is Test {
    ODINsEyeOrbitalLedger ledger;

    function setUp() public {
        ledger = new ODINsEyeOrbitalLedger();
    }

    function testTagLaunchEvent() public {
        string memory originNation = "Russia";
        string memory missileType = "Hypersonic";
        string memory emotionalTag = "Orbital breach detected";
        string memory consequenceTier = "Tier 5: Defense mobilization";
        string memory restorationAction = "Activate EU defense corridor and seal sovereignty protocol";

        uint256 id = ledger.tagLaunchEvent(
            originNation,
            missileType,
            emotionalTag,
            consequenceTier,
            restorationAction
        );

        ODINsEyeOrbitalLedger.LaunchEvent memory eventData = ledger.getLaunchEvent(id);

        assertEq(eventData.originNation, originNation);
        assertEq(eventData.missileType, missileType);
        assertEq(eventData.emotionalTag, emotionalTag);
        assertEq(eventData.consequenceTier, consequenceTier);
        assertEq(eventData.restorationAction, restorationAction);
    }
}
