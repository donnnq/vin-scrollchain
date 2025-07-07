// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import { VinScrollVeilV2, IERC1155 } from "contracts/core/vin-scrollveil-v2.sol";

// Minimal mock ERC1155 to simulate scroll transfers
contract MockERC1155 is IERC1155 {
    mapping(address => mapping(uint256 => uint256)) public balances;

    function mint(address to, uint256 id, uint256 amount) external {
        balances[to][id] += amount;
    }

    function safeTransferFrom(address from, address to, uint256 id, uint256 amount, bytes calldata) external override {
        require(balances[from][id] >= amount, "Insufficient balance");
        balances[from][id] -= amount;
        balances[to][id] += amount;
    }
}

contract ScrollVeilTest is Test {
    VinScrollVeilV2 veil;
    MockERC1155 scrollToken;
    address user = address(0xBEEF);

    function setUp() public {
        scrollToken = new MockERC1155();
        veil = new VinScrollVeilV2(address(scrollToken));
    }

    function testCreateVeil() public {
        vm.prank(address(this)); // veilkeeper
        veil.createVeil("Hidden wisdom", 1, 3);

        (bool revealed, uint256 id, uint256 amt) = veil.getVeilStatus(0);
        assertEq(revealed, false);
        assertEq(id, 1);
        assertEq(amt, 3);
    }

    function testRevealVeil() public {
        // Setup: create veil
        vm.prank(address(this));
        veil.createVeil("The scroll whispers truth", 42, 2);

        // Mint scrolls to user
        scrollToken.mint(user, 42, 2);

        // User reveals the veil
        vm.prank(user);
        veil.revealVeil(0);

        (bool revealed,,) = veil.getVeilStatus(0);
        assertTrue(revealed);
    }
}
