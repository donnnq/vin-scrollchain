// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FactoryGhostOwnershipDAO {
    address public originator;

    struct GhostFactory {
        string location;
        bool isRotten;
        bool isOwnedByProxy;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    GhostFactory[] public ghostLedger;

    constructor() {
        originator = msg.sender;
    }

    function logGhostFactory(
        string memory location,
        bool isRotten,
        bool isOwnedByProxy,
        bool isScrollchainSealed
    ) external {
        ghostLedger.push(GhostFactory({
            location: location,
            isRotten: isRotten,
            isOwnedByProxy: isOwnedByProxy,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
