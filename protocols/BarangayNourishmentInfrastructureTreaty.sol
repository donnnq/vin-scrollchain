// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayNourishmentInfrastructureTreaty {
    address public steward;

    struct NourishmentClause {
        string barangay;
        string infrastructureType;
        string nourishmentOutcome;
        string emotionalTag;
    }

    NourishmentClause[] public treatyLog;

    event NourishmentInfrastructureTagged(string barangay, string infrastructureType, string nourishmentOutcome, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagNourishmentInfrastructure(
        string memory barangay,
        string memory infrastructureType,
        string memory nourishmentOutcome,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(NourishmentClause(barangay, infrastructureType, nourishmentOutcome, emotionalTag));
        emit NourishmentInfrastructureTagged(barangay, infrastructureType, nourishmentOutcome, emotionalTag);
    }
}
