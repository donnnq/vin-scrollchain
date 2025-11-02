// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TradeSecretBreachLedgerDAO {
    address public steward;

    struct BreachEntry {
        string perpetrator;
        string corridor;
        uint256 breachValueUSD;
        string emotionalTag;
    }

    BreachEntry[] public ledger;

    event BreachLogged(string perpetrator, string corridor, uint256 breachValueUSD, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logBreach(
        string memory perpetrator,
        string memory corridor,
        uint256 breachValueUSD,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(BreachEntry(perpetrator, corridor, breachValueUSD, emotionalTag));
        emit BreachLogged(perpetrator, corridor, breachValueUSD, emotionalTag);
    }
}
