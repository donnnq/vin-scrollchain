// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReverseAutomationDAO {
    address public steward;

    struct AutomationReversal {
        string companyName;
        string humanHire;
        string robotDecommissionSignal;
        string emotionalTag;
    }

    AutomationReversal[] public registry;

    event AutomationReversed(string companyName, string humanHire, string robotDecommissionSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function reverseAutomation(
        string memory companyName,
        string memory humanHire,
        string memory robotDecommissionSignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AutomationReversal(companyName, humanHire, robotDecommissionSignal, emotionalTag));
        emit AutomationReversed(companyName, humanHire, robotDecommissionSignal, emotionalTag);
    }
}
