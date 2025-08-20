pragma solidity ^0.8.21;

import "forge-std/Test.sol";
import {VinvinRestorationFund} from "contracts/chinaRestoration/VinvinRestorationFund.sol";

contract vinRestorationFundTest is Test {
    VinvinRestorationFund fund;
    address steward = address(this);

    address citizen1 = address(0xC1);
    address citizen2 = address(0xC2);
    address citizen3 = address(0xC3);

    function setUp() public {
        fund = new VinvinRestorationFund();
    }

    function testVerifyAndBlessSingleCitizen() public {
        fund.verifyCitizen(citizen1);
        fund.bless(citizen1, 1 ether);

        assertEq(fund.getBlessing(citizen1), 1 ether);
        assertTrue(fund.isVerified(citizen1));
    }

    function testBatchBlessingSimulation() public {
        fund.verifyCitizen(citizen1);
        fund.verifyCitizen(citizen2);
        fund.verifyCitizen(citizen3);

        fund.bless(citizen1, 0.5 ether);
        fund.bless(citizen2, 0.75 ether);
        fund.bless(citizen3, 1 ether);

        assertEq(fund.getBlessing(citizen1), 0.5 ether);
        assertEq(fund.getBlessing(citizen2), 0.75 ether);
        assertEq(fund.getBlessing(citizen3), 1 ether);
    }

    function testBlessingFailsIfNotVerified() public {
        vm.expectRevert("Citizen not verified.");
        fund.bless(citizen1, 1 ether);
    }

    function testBlessingFailsIfZeroAmount() public {
        fund.verifyCitizen(citizen1);
        vm.expectRevert("Blessing must be greater than zero.");
        fund.bless(citizen1, 0);
    }

    function testFuzzBlessingAmount(uint256 amount) public {
        vm.assume(amount > 0 && amount < 10 ether);
        fund.verifyCitizen(citizen1);
        fund.bless(citizen1, amount);

        assertEq(fund.getBlessing(citizen1), amount);
    }
}
