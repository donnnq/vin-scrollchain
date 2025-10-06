// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EmbassyGrantProtocol {
    address public originator;

    struct GrantScroll {
        string countryTag;
        string embassyTag;
        string grantPurpose;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    GrantScroll[] public grantLedger;

    constructor() {
        originator = msg.sender;
    }

    function logGrantScroll(
        string memory countryTag,
        string memory embassyTag,
        string memory grantPurpose,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        grantLedger.push(GrantScroll({
            countryTag: countryTag,
            embassyTag: embassyTag,
            grantPurpose: grantPurpose,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
