// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract OversightCommissionerDAO {
    address public originator;

    struct OversightAction {
        string commissionerName;
        string actionType;
        string targetEntity;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    OversightAction[] public actionLedger;

    constructor() {
        originator = msg.sender;
    }

    function logOversightAction(
        string memory commissionerName,
        string memory actionType,
        string memory targetEntity,
        bool isScrollchainSealed
    ) external {
        actionLedger.push(OversightAction({
            commissionerName: commissionerName,
            actionType: actionType,
            targetEntity: targetEntity,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
