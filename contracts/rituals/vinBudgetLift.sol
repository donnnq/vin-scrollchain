// SPDX-License-Identifier: LIFT-BASE
pragma solidity ^0.8.0;

/// @title vinBudgetLift: Scroll for minimum budget upliftment and communal rebalance
contract vinBudgetLift {
    struct LiftGrant {
        address grantee;
        uint256 amount;
        string purpose;
        string dignitySpell;
    }

    LiftGrant[] public budgetLiftLog;
    address public grantAdmin;
    uint256 public baseMinimum = 5000; // Starter dignity budget in PHP

    event GrantIssued(address grantee, uint256 amount, string purpose);
    event MinimumAdjusted(uint256 oldMin, uint256 newMin);

    constructor() {
        grantAdmin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == grantAdmin, "Forbidden ritual.");
        _;
    }

    function issueGrant(address grantee, uint256 amount, string memory purpose, string memory dignitySpell) public onlyAdmin {
        require(amount >= baseMinimum, "Below dignity budget.");
        budgetLiftLog.push(LiftGrant(grantee, amount, purpose, dignitySpell));
        emit GrantIssued(grantee, amount, purpose);
    }

    function adjustMinimum(uint256 newMinimum) public onlyAdmin {
        emit MinimumAdjusted(baseMinimum, newMinimum);
        baseMinimum = newMinimum;
    }

    function summonLiftLog() public view returns (LiftGrant[] memory) {
        return budgetLiftLog;
    }
}
