// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract VaultBroadcastProtocol {
    address public originator;

    struct BroadcastScroll {
        string vaultTag;
        string yieldSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    BroadcastScroll[] public broadcastLedger;

    constructor() {
        originator = msg.sender;
    }

    function logBroadcastScroll(
        string memory vaultTag,
        string memory yieldSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        broadcastLedger.push(BroadcastScroll({
            vaultTag: vaultTag,
            yieldSignal: yieldSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
