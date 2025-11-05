// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DBHASARelocationTreaty {
    address public steward;

    struct TreatyClause {
        string relocationSite;
        string sanctuaryStandard;
        string treatyMechanism;
        string emotionalTag;
    }

    TreatyClause[] public treatyLog;

    event DBHASARelocationTagged(string relocationSite, string sanctuaryStandard, string treatyMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRelocation(
        string memory relocationSite,
        string memory sanctuaryStandard,
        string memory treatyMechanism,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(TreatyClause(relocationSite, sanctuaryStandard, treatyMechanism, emotionalTag));
        emit DBHASARelocationTagged(relocationSite, sanctuaryStandard, treatyMechanism, emotionalTag);
    }
}
