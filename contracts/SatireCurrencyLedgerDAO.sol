// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SatireCurrencyLedgerDAO {
    address public originator;

    struct SatireMint {
        string currencyName;
        string faceOnBill;
        string eventDistributed;
        bool usedForKupitAudit;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    SatireMint[] public satireLedger;

    constructor() {
        originator = msg.sender;
    }

    function logSatireMint(
        string memory currencyName,
        string memory faceOnBill,
        string memory eventDistributed,
        bool usedForKupitAudit,
        bool isScrollchainSealed
    ) external {
        satireLedger.push(SatireMint({
            currencyName: currencyName,
            faceOnBill: faceOnBill,
            eventDistributed: eventDistributed,
            usedForKupitAudit: usedForKupitAudit,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
