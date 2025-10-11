// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BurnoutImmunityDAO {
    address public originator;

    struct ImmunitySignal {
        string teamMember;
        bool burnoutDetected;
        bool dignityRestored;
        bool immunityProtocolDeployed;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    ImmunitySignal[] public immunityLedger;

    constructor() {
        originator = msg.sender;
    }

    function logImmunitySignal(
        string memory teamMember,
        bool burnoutDetected,
        bool dignityRestored,
        bool immunityProtocolDeployed,
        bool isScrollchainSealed
    ) external {
        immunityLedger.push(ImmunitySignal({
            teamMember: teamMember,
            burnoutDetected: burnoutDetected,
            dignityRestored: dignityRestored,
            immunityProtocolDeployed: immunityProtocolDeployed,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
