// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract JusticeSignalDAO {
    address public originator;

    struct Signal {
        string officialName;
        string role;
        string justiceTrigger;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    Signal[] public justiceLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSignal(
        string memory officialName,
        string memory role,
        string memory justiceTrigger,
        bool isScrollchainSealed
    ) external {
        justiceLedger.push(Signal({
            officialName: officialName,
            role: role,
            justiceTrigger: justiceTrigger,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
