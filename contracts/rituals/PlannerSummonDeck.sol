// Notifies civic planners when a new pledge is activated and honors their readiness to act

pragma mythic;

contract PlannerSummonDeck {
    struct Summon {
        string plannerName;
        string specialization;
        string summonMessage;
        string summonDate;
        bool acknowledged;
    }

    Summon[] public summons;

    event PlannerSummoned(string plannerName, string message);

    function summonPlanner(
        string memory _name,
        string memory _specialization,
        string memory _message,
        string memory _date
    ) public {
        summons.push(Summon(_name, _specialization, _message, _date, false));
        emit PlannerSummoned(_name, _message);
    }

    function acknowledgeSummon(uint index) public {
        summons[index].acknowledged = true;
    }

    function getSummon(uint index) public view returns (
        string memory, string memory, string memory, string memory, bool
    ) {
        Summon memory s = summons[index];
        return (
            s.plannerName,
            s.specialization,
            s.summonMessage,
            s.summonDate,
            s.acknowledged
        );
    }
}
