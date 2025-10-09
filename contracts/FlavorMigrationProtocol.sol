// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FlavorMigrationProtocol {
    address public originator;

    struct MigrationScroll {
        string productTag;
        string diasporaCorridor;
        string ignitionSignal;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    MigrationScroll[] public migrationLedger;

    constructor() {
        originator = msg.sender;
    }

    function logMigrationScroll(
        string memory productTag,
        string memory diasporaCorridor,
        string memory ignitionSignal,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        migrationLedger.push(MigrationScroll({
            productTag: productTag,
            diasporaCorridor: diasporaCorridor,
            ignitionSignal: ignitionSignal,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
