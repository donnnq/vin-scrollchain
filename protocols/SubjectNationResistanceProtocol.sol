// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SubjectNationResistanceProtocol {
    address public steward;

    struct ResistanceClause {
        string nationName;
        string dependencyType;
        string resistanceAction;
        string emotionalTag;
    }

    ResistanceClause[] public registry;

    event SubjectNationResisted(string nationName, string dependencyType, string resistanceAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function resistDependency(
        string memory nationName,
        string memory dependencyType,
        string memory resistanceAction,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ResistanceClause(nationName, dependencyType, resistanceAction, emotionalTag));
        emit SubjectNationResisted(nationName, dependencyType, resistanceAction, emotionalTag);
    }
}
