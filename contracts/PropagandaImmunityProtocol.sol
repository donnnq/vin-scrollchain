// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PropagandaImmunityProtocol {
    address public originator;

    struct ImmunityScroll {
        string sourceTag;
        string propagandaSignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ImmunityScroll[] public immunityLedger;

    constructor() {
        originator = msg.sender;
    }

    function logImmunityScroll(
        string memory sourceTag,
        string memory propagandaSignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        immunityLedger.push(ImmunityScroll({
            sourceTag: sourceTag,
            propagandaSignal: propagandaSignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
