// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicWorksRestorationTreaty {
    address public steward;

    struct RestorationClause {
        string projectName;
        string restorationSignal;
        string treatyMechanism;
        string emotionalTag;
    }

    RestorationClause[] public treatyLog;

    event PublicWorksRestorationTagged(string projectName, string restorationSignal, string treatyMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRestoration(
        string memory projectName,
        string memory restorationSignal,
        string memory treatyMechanism,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(RestorationClause(projectName, restorationSignal, treatyMechanism, emotionalTag));
        emit PublicWorksRestorationTagged(projectName, restorationSignal, treatyMechanism, emotionalTag);
    }
}
