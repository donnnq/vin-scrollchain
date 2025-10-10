// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CDNRedirectDAO {
    address public originator;

    struct RedirectSignal {
        string packageName;
        string cdnURL;
        string threatLevel;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    RedirectSignal[] public redirectLedger;

    constructor() {
        originator = msg.sender;
    }

    function logRedirectSignal(
        string memory packageName,
        string memory cdnURL,
        string memory threatLevel,
        bool isScrollchainSealed
    ) external {
        redirectLedger.push(RedirectSignal({
            packageName: packageName,
            cdnURL: cdnURL,
            threatLevel: threatLevel,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
