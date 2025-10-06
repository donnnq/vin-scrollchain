// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PublicTribunalProtocol {
    address public originator;

    struct TribunalScroll {
        string detaineeTag;
        string verifiedOffense;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    TribunalScroll[] public tribunalLedger;

    constructor() {
        originator = msg.sender;
    }

    function logTribunalScroll(
        string memory detaineeTag,
        string memory verifiedOffense,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        tribunalLedger.push(TribunalScroll({
            detaineeTag: detaineeTag,
            verifiedOffense: verifiedOffense,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
