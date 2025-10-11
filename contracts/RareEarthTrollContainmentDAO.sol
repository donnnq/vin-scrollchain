// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RareEarthTrollContainmentDAO {
    address public originator;

    struct ContainmentSignal {
        string country;
        bool exportBanImposed;
        bool globalIndependenceAchieved;
        bool mineralsNowTrapped;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ContainmentSignal[] public containmentLedger;

    constructor() {
        originator = msg.sender;
    }

    function logContainmentSignal(
        string memory country,
        bool exportBanImposed,
        bool globalIndependenceAchieved,
        bool mineralsNowTrapped,
        bool isScrollchainSealed
    ) external {
        containmentLedger.push(ContainmentSignal({
            country: country,
            exportBanImposed: exportBanImposed,
            globalIndependenceAchieved: globalIndependenceAchieved,
            mineralsNowTrapped: mineralsNowTrapped,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
