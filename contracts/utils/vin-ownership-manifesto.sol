// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinOwnership {
    address public immutable trueOwner;

    event Claimed(address by);
    event Revoked(address from);

    constructor() {
        trueOwner = msg.sender;
        emit Claimed(msg.sender);
    }

    function revoke(address from) external {
        require(msg.sender == trueOwner, "Only the true owner can revoke.");
        emit Revoked(from);
    }
}
