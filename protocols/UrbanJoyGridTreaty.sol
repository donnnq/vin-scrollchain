// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanJoyGridTreaty {
    address public steward;

    struct JoyClause {
        string city;
        string joyElement;
        string civicOutcome;
        string emotionalTag;
    }

    JoyClause[] public treatyLog;

    event JoyGridTagged(string city, string joyElement, string civicOutcome, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagJoyGrid(
        string memory city,
        string memory joyElement,
        string memory civicOutcome,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(JoyClause(city, joyElement, civicOutcome, emotionalTag));
        emit JoyGridTagged(city, joyElement, civicOutcome, emotionalTag);
    }
}
