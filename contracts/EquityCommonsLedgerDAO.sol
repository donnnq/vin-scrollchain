// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EquityCommonsLedgerDAO {
    address public originator;

    struct EquityScroll {
        address worker;
        string companyTag;
        uint256 equityShare;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    EquityScroll[] public equityLedger;

    constructor() {
        originator = msg.sender;
    }

    function logEquityScroll(
        address worker,
        string memory companyTag,
        uint256 equityShare,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        equityLedger.push(EquityScroll({
            worker: worker,
            companyTag: companyTag,
            equityShare: equityShare,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
