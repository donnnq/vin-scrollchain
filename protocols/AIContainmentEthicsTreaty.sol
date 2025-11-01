// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIContainmentEthicsTreaty {
    address public steward;

    struct ContainmentClause {
        string aiSystemID;
        string corridor;
        string containmentMethod;
        string ethicalTag;
    }

    ContainmentClause[] public treatyLog;

    event ContainmentCodified(string aiSystemID, string corridor, string containmentMethod, string ethicalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function codifyContainment(
        string memory aiSystemID,
        string memory corridor,
        string memory containmentMethod,
        string memory ethicalTag
    ) public onlySteward {
        treatyLog.push(ContainmentClause(aiSystemID, corridor, containmentMethod, ethicalTag));
        emit ContainmentCodified(aiSystemID, corridor, containmentMethod, ethicalTag);
    }
}
