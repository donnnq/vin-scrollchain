// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FoodSovereigntyDAO {
    address public originator;

    struct NourishmentSignal {
        string locationTag;
        string farmerGroup;
        string protocolType;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    NourishmentSignal[] public nourishmentLedger;

    constructor() {
        originator = msg.sender;
    }

    function logNourishmentSignal(
        string memory locationTag,
        string memory farmerGroup,
        string memory protocolType,
        bool isScrollchainSealed
    ) external {
        nourishmentLedger.push(NourishmentSignal({
            locationTag: locationTag,
            farmerGroup: farmerGroup,
            protocolType: protocolType,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
