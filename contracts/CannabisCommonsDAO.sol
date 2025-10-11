// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CannabisCommonsDAO {
    address public originator;

    struct CommonsSignal {
        string country;
        string strainName;
        bool heirloomProtected;
        bool culturalEquityEnabled;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    CommonsSignal[] public commonsLedger;

    constructor() {
        originator = msg.sender;
    }

    function logCommonsSignal(
        string memory country,
        string memory strainName,
        bool heirloomProtected,
        bool culturalEquityEnabled,
        bool isScrollchainSealed
    ) external {
        commonsLedger.push(CommonsSignal({
            country: country,
            strainName: strainName,
            heirloomProtected: heirloomProtected,
            culturalEquityEnabled: culturalEquityEnabled,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
