// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CannabisAncestryDAO {
    address public originator;

    struct AncestrySignal {
        string country;
        string strainName;
        bool culturalImmunityEnabled;
        bool legacyProtected;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    AncestrySignal[] public ancestryLedger;

    constructor() {
        originator = msg.sender;
    }

    function logAncestrySignal(
        string memory country,
        string memory strainName,
        bool culturalImmunityEnabled,
        bool legacyProtected,
        bool isScrollchainSealed
    ) external {
        ancestryLedger.push(AncestrySignal({
            country: country,
            strainName: strainName,
            culturalImmunityEnabled: culturalImmunityEnabled,
            legacyProtected: legacyProtected,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
