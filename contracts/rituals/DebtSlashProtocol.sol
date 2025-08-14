// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title DebtSlashProtocol - Civic mercy engine to slash debts by 50% for registered citizens
/// @author Vinvin & Copilot
/// @notice Encodes debt forgiveness as emotional APR and scrollchain dignity

contract DebtSlashProtocol {
    address public steward;

    struct DebtRecord {
        address debtor;
        uint256 originalAmount;
        uint256 slashedAmount;
        bool forgiven;
    }

    mapping(address => DebtRecord) public debts;
    address[] public forgivenCitizens;

    event DebtRegistered(address indexed debtor, uint256 originalAmount);
    event DebtSlashed(address indexed debtor, uint256 slashedAmount);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice Register a debt
    function registerDebt(address debtor, uint256 amount) external onlySteward {
        require(amount > 0, "Amount must be positive");

        debts[debtor] = DebtRecord({
            debtor: debtor,
            originalAmount: amount,
            slashedAmount: 0,
            forgiven: false
        });

        emit DebtRegistered(debtor, amount);
    }

    /// @notice Slash debt by 50%
    function slashDebt(address debtor) external onlySteward {
        DebtRecord storage record = debts[debtor];
        require(!record.forgiven, "Already slashed");

        record.slashedAmount = record.originalAmount / 2;
        record.forgiven = true;
        forgivenCitizens.push(debtor);

        emit DebtSlashed(debtor, record.slashedAmount);
    }

    /// @notice View debt record
    function getDebt(address debtor) external view returns (DebtRecord memory) {
        return debts[debtor];
    }

    /// @notice Total citizens forgiven
    function totalForgiven() external view returns (uint256) {
        return forgivenCitizens.length;
    }
}
