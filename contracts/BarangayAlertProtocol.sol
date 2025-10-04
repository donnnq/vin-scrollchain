// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BarangayAlertProtocol {
    address public originator;

    struct AlertScroll {
        string barangayTag;
        string hazardType;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    AlertScroll[] public alertLedger;

    constructor() {
        originator = msg.sender;
    }

    function logAlertScroll(
        string memory barangayTag,
        string memory hazardType,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        alertLedger.push(AlertScroll({
            barangayTag: barangayTag,
            hazardType: hazardType,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
