// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

contract AppealBlockerDetector {
    address public steward;

    struct Hearing {
        string caseId;
        string jurisdiction;
        bool appealAllowed;
        string blockerReason;
        uint256 timestamp;
    }

    mapping(string => Hearing) public hearings;
    string[] public flaggedCases;

    event AppealBlocked(string indexed caseId, string jurisdiction, string reason);
    event AppealRestored(string indexed caseId);

    constructor() {
        steward = msg.sender;
    }

    function logHearing(
        string memory caseId,
        string memory jurisdiction,
        bool appealAllowed,
        string memory blockerReason
    ) public {
        require(msg.sender == steward, "Only steward can log");

        Hearing memory h = Hearing({
            caseId: caseId,
            jurisdiction: jurisdiction,
            appealAllowed: appealAllowed,
            blockerReason: blockerReason,
            timestamp: block.timestamp
        });

        hearings[caseId] = h;

        if (!appealAllowed) {
            flaggedCases.push(caseId);
            emit AppealBlocked(caseId, jurisdiction, blockerReason);
        }
    }

    function restoreAppeal(string memory caseId) public {
        require(msg.sender == steward, "Only steward can restore");
        require(!hearings[caseId].appealAllowed, "Appeal already allowed");

        hearings[caseId].appealAllowed = true;
        hearings[caseId].blockerReason = "Appeal restored by steward";
        emit AppealRestored(caseId);
    }

    function getHearing(string memory caseId) public view returns (Hearing memory) {
        return hearings[caseId];
    }

    function getFlaggedCases() public view returns (string[] memory) {
        return flaggedCases;
    }
}
