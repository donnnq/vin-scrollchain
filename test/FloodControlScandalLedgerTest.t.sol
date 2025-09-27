// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "contracts/global/FloodControlScandalLedger.sol";
import "forge-std/Test.sol";

contract FloodControlScandalLedgerTest is Test {
    FloodControlScandalLedger ledger;

    function setUp() public {
        ledger = new FloodControlScandalLedger();
    }

    function testActivateScandalClause() public {
        string memory corridor = "Senate";
        string memory clauseTitle = "Budget Insertion Cartel";
        string memory emotionalTag = "Floodgate breach ritualized";
        string memory restorationAction = "Seal civic trust corridor and activate audit clause";
        string memory equityClause = "We restore validator-grade consequence across public infrastructure corridors";

        uint256 id = ledger.activateScandalClause(
            corridor,
            clauseTitle,
            emotionalTag,
            restorationAction,
            equityClause
        );

        FloodControlScandalLedger.ScandalClause memory clause = ledger.getScandalClause(id);

        assertEq(clause.corridor, corridor);
        assertEq(clause.clauseTitle, clauseTitle);
        assertEq(clause.emotionalTag, emotionalTag);
        assertEq(clause.restorationAction, restorationAction);
        assertEq(clause.equityClause, equityClause);
    }
}
