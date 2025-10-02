// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Corridor Yield Protocol v1.0
/// @notice Simple, accessible, emotionally tagged smart contract for PH corridor investors and creators

contract CorridorYieldProtocol {
    struct Holder {
        uint256 startTime;
        bool isCreator;
        bool isCorridorSteward;
    }

    mapping(address => Holder) public holders;

    /// @notice Register a new holder
    function register(bool creator, bool steward) external {
        holders[msg.sender] = Holder({
            startTime: block.timestamp,
            isCreator: creator,
            isCorridorSteward: steward
        });
    }

    /// @notice Calculate yield based on holding time and emotional tags
    function calculateYield(address holderAddr) external view returns (uint256) {
        Holder memory h = holders[holderAddr];
        uint256 duration = block.timestamp - h.startTime;
        uint256 baseAPR = 5;

        if (h.isCreator) baseAPR += 3;
        if (h.isCorridorSteward) baseAPR += 2;

        return (duration / 365 days) * baseAPR;
    }
}
