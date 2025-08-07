// SPDX-License-Identifier: CIVIC-RITUAL-PATHWAY
pragma solidity ^0.8.19;

contract vinImpeachmentPathway {
    enum ImpeachmentStage {
        Drafted,
        Filed,
        UnderReview,
        ApprovedByHouse,
        SentToSenate,
        TrialOngoing,
        Verdict
    }

    struct Case {
        string respondent;
        ImpeachmentStage stage;
        bool hasLegalObstacle;
    }

    address public civicAuthority;
    uint public caseCount;
    mapping(uint => Case) public cases;

    event CaseFiled(uint caseId, string respondent);
    event StageUpdated(uint caseId, ImpeachmentStage newStage);
    event ObstacleResolved(uint caseId);
    event ScrollNote(string tag, uint indexed caseId);

    modifier onlyAuthority() {
        require(msg.sender == civicAuthority, "Scroll access denied");
        _;
    }

    constructor() {
        civicAuthority = msg.sender;
    }

    function fileCase(string calldata respondent) external onlyAuthority returns (uint) {
        caseCount++;
        cases[caseCount] = Case(respondent, ImpeachmentStage.Drafted, false);
        emit CaseFiled(caseCount, respondent);
        return caseCount;
    }

    function updateStage(uint caseId, ImpeachmentStage newStage) external onlyAuthority {
        require(caseId <= caseCount, "Invalid scroll ID");
        cases[caseId].stage = newStage;
        emit StageUpdated(caseId, newStage);
    }

    function imposeObstacle(uint caseId) external onlyAuthority {
        require(caseId <= caseCount, "Invalid scroll ID");
        cases[caseId].hasLegalObstacle = true;
        emit ScrollNote("Legal obstacle imposed", caseId);
    }

    function resolveObstacle(uint caseId) external onlyAuthority {
        require(caseId <= caseCount, "Invalid scroll ID");
        require(cases[caseId].hasLegalObstacle, "No obstacle to resolve");
        cases[caseId].hasLegalObstacle = false;
        emit ObstacleResolved(caseId);
    }

    function getCase(uint caseId) external view returns (Case memory) {
        require(caseId <= caseCount, "Invalid scroll ID");
        return cases[caseId];
    }
}
