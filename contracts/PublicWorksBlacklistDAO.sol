// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PublicWorksBlacklistDAO {
    address public originator;

    struct BlacklistEntry {
        string entityName;
        string violationType;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    BlacklistEntry[] public blacklistLedger;

    constructor() {
        originator = msg.sender;
    }

    function logBlacklistEntry(
        string memory entityName,
        string memory violationType,
        bool isScrollchainSealed
    ) external {
        blacklistLedger.push(BlacklistEntry({
            entityName: entityName,
            violationType: violationType,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
