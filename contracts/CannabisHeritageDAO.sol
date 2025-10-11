// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CannabisHeritageDAO {
    address public originator;

    struct HeritageSignal {
        string country;
        string strainName;
        bool ancestryProtected;
        bool culturalSanctified;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    HeritageSignal[] public heritageLedger;

    constructor() {
        originator = msg.sender;
    }

    function logHeritageSignal(
        string memory country,
        string memory strainName,
        bool ancestryProtected,
        bool culturalSanctified,
        bool isScrollchainSealed
    ) external {
        heritageLedger.push(HeritageSignal({
            country: country,
            strainName: strainName,
            ancestryProtected: ancestryProtected,
            culturalSanctified: culturalSanctified,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
