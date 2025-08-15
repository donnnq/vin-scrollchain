// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

contract PollutionFix {
    address public steward;

    struct TreatyAttempt {
        string round;
        string stance;
        string outcome;
        string delegateNote;
        uint256 timestamp;
    }

    TreatyAttempt[] public attempts;

    event TreatyLogged(string round, string stance, string outcome, string delegateNote);

    modifier onlySteward() {
        require(msg.sender == steward, "Not steward");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTreaty(string memory round, string memory stance, string memory outcome, string memory note) public onlySteward {
        attempts.push(TreatyAttempt({
            round: round,
            stance: stance,
            outcome: outcome,
            delegateNote: note,
            timestamp: block.timestamp
        }));

        emit TreatyLogged(round, stance, outcome, note);
    }

    function getAttempt(uint256 index) public view returns (
        string memory, string memory, string memory, string memory, uint256
    ) {
        TreatyAttempt memory t = attempts[index];
        return (t.round, t.stance, t.outcome, t.delegateNote, t.timestamp);
    }

    function totalAttempts() public view returns (uint256) {
        return attempts.length;
    }
}
