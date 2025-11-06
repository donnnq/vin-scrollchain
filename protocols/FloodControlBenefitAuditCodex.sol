// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlBenefitAuditCodex {
    address public steward;

    struct BenefitClause {
        string projectName;
        string publicBenefit;
        string privateGain;
        string landValueImpact;
        string emotionalTag;
    }

    BenefitClause[] public codex;

    event FloodControlBenefitTagged(string projectName, string publicBenefit, string privateGain, string landValueImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagBenefit(
        string memory projectName,
        string memory publicBenefit,
        string memory privateGain,
        string memory landValueImpact,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(BenefitClause(projectName, publicBenefit, privateGain, landValueImpact, emotionalTag));
        emit FloodControlBenefitTagged(projectName, publicBenefit, privateGain, landValueImpact, emotionalTag);
    }
}
