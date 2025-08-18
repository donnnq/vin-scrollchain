// SPDX-License-Identifier: Mythic-Test-License
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../contracts/labor-restoration/vinWorkerReentryBlessing.sol";

contract vinWorkerReentryBlessingTest is Test {
    vinWorkerReentryBlessing blessing;

    address worker = address(0xB1);
    address employer = address(0xE1);

    function setUp() public {
        blessing = new vinWorkerReentryBlessing();
    }

    function testBlessAndMatchWorker() public {
        blessing.blessWorker(worker, "Scrollsmith", "Trust 72, Dignity 85");
        blessing.sanctifyEmployer(employer, "Scrollsmith", "Dignity 95");

        string memory role = blessing.matchWorkerToRole(worker, employer);
        assertEq(role, "Scrollsmith");
    }
}
