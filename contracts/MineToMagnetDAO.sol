// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MineToMagnetDAO {
    address public originator;

    struct MagnetSignal {
        string siteLocation;
        string magnetType;
        string workforceStatus;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    MagnetSignal[] public magnetLedger;

    constructor() {
        originator = msg.sender;
    }

    function logMagnetSignal(
        string memory siteLocation,
        string memory magnetType,
        string memory workforceStatus,
        bool isScrollchainSealed
    ) external {
        magnetLedger.push(MagnetSignal({
            siteLocation: siteLocation,
            magnetType: magnetType,
            workforceStatus: workforceStatus,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
