// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SkilledLaborDignityLedger {
    address public steward;

    struct LaborEntry {
        string tradeType;
        string dignityProtocol;
        string trainingSignal;
        string emotionalTag;
    }

    LaborEntry[] public ledger;

    event SkilledLaborTagged(string tradeType, string dignityProtocol, string trainingSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagLabor(
        string memory tradeType,
        string memory dignityProtocol,
        string memory trainingSignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(LaborEntry(tradeType, dignityProtocol, trainingSignal, emotionalTag));
        emit SkilledLaborTagged(tradeType, dignityProtocol, trainingSignal, emotionalTag);
    }
}
