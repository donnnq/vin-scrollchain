// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RemittanceEquityProtocol {
    address public originator;

    struct RemittanceScroll {
        string originCountry;
        string destinationCountry;
        uint256 remittanceAmount;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    RemittanceScroll[] public remittanceLedger;

    constructor() {
        originator = msg.sender;
    }

    function logRemittanceScroll(
        string memory originCountry,
        string memory destinationCountry,
        uint256 remittanceAmount,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        remittanceLedger.push(RemittanceScroll({
            originCountry: originCountry,
            destinationCountry: destinationCountry,
            remittanceAmount: remittanceAmount,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
