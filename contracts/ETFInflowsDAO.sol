// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ETFInflowsDAO {
    address public originator;

    struct InflowSignal {
        string asset;
        uint256 inflowAmount;
        string sourceInstitution;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    InflowSignal[] public inflowLedger;

    constructor() {
        originator = msg.sender;
    }

    function logInflowSignal(
        string memory asset,
        uint256 inflowAmount,
        string memory sourceInstitution,
        bool isScrollchainSealed
    ) external {
        inflowLedger.push(InflowSignal({
            asset: asset,
            inflowAmount: inflowAmount,
            sourceInstitution: sourceInstitution,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
