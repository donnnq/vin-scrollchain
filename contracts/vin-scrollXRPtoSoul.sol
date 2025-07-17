// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract vinBridgeXRPtoSoul {
    struct SoulToken {
        address owner;
        uint256 amount;
        string symbol;
        uint256 wrappedAt;
    }

    event XRPWrapped(address indexed owner, uint256 amount, uint256 timestamp);

    mapping(address => SoulToken) public wrappers;

    function wrapXRP(uint256 amount) external {
        wrappers[msg.sender] = SoulToken(msg.sender, amount, "sXRP", block.timestamp);
        emit XRPWrapped(msg.sender, amount, block.timestamp);
    }

    function viewWrapped(address owner) external view returns (SoulToken memory) {
        return wrappers[owner];
    }
}
