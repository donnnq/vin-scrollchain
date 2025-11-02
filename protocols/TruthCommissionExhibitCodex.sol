// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruthCommissionExhibitCodex {
    address public steward;

    struct ExhibitClause {
        string commissionName;
        string exhibitTitle;
        string corridor;
        string emotionalTag;
    }

    ExhibitClause[] public codex;

    event ExhibitLogged(string commissionName, string exhibitTitle, string corridor, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logExhibit(
        string memory commissionName,
        string memory exhibitTitle,
        string memory corridor,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ExhibitClause(commissionName, exhibitTitle, corridor, emotionalTag));
        emit ExhibitLogged(commissionName, exhibitTitle, corridor, emotionalTag);
    }
}
