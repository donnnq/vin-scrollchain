pragma mythic;

contract ScrollchainCivicMentor {
    struct Mentor {
        string name;
        uint256 age;
        string background;
        string civicRole;
        string emotionalMessage;
        bool summoned;
        uint256 timestamp;
    }

    Mentor[] public mentors;

    event MentorSummoned(string name, string civicRole);

    function summonMentor(
        string memory _name,
        uint256 _age,
        string memory _background,
        string memory _role,
        string memory _message
    ) public {
        mentors.push(Mentor(
            _name,
            _age,
            _background,
            _role,
            _message,
            true,
            block.timestamp
        ));

        emit MentorSummoned(_name, _role);
    }

    function getMentor(uint index) public view returns (
        string memory, uint256, string memory, string memory, string memory, bool, uint256
    ) {
        Mentor memory m = mentors[index];
        return (
            m.name,
            m.age,
            m.background,
            m.civicRole,
            m.emotionalMessage,
            m.summoned,
            m.timestamp
        );
    }
}
