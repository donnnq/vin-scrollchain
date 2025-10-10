// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EurozoneContainmentDAO {
    address public originator;

    struct ContainmentSignal {
        string stablecoinTargeted;
        string euroPolicyImpact;
        string ETHReaction;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ContainmentSignal[] public containmentLedger;

    constructor() {
        originator = msg.sender;
    }

    function logContainmentSignal(
        string memory stablecoinTargeted,
        string memory euroPolicyImpact,
        string memory ETHReaction,
        bool isScrollchainSealed
    ) external {
        containmentLedger.push(ContainmentSignal({
            stablecoinTargeted: stablecoinTargeted,
            euroPolicyImpact: euroPolicyImpact,
            ETHReaction: ETHReaction,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
