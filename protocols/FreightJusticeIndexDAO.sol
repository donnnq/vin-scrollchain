// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FreightJusticeIndexDAO {
    address public steward;

    struct JusticeEntry {
        string freightOperator;
        string corridor;
        uint256 justiceScore;
        string emotionalTag;
    }

    JusticeEntry[] public index;

    event JusticeLogged(string freightOperator, string corridor, uint256 justiceScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logJustice(
        string memory freightOperator,
        string memory corridor,
        uint256 justiceScore,
        string memory emotionalTag
    ) public onlySteward {
        index.push(JusticeEntry(freightOperator, corridor, justiceScore, emotionalTag));
        emit JusticeLogged(freightOperator, corridor, justiceScore, emotionalTag);
    }
}
