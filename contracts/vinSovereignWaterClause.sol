/// @title vinSovereignWaterClause — Notice of Trespass and Consequence
contract vinSovereignWaterClause {
    event TrespassWarningIssued(string nation, string reason);
    event ConsequenceMarked(string nation);

    function issueWarning(string memory _nation) public {
        string memory reason = "Unauthorized entry beyond EEZ boundary without prior dialogue or clearance.";
        emit TrespassWarningIssued(_nation, reason);
    }

    function markForConsequence(string memory _nation) public {
        emit ConsequenceMarked(_nation);
    }
}
