pragma solidity ^0.8.20;

contract vinPublicCivicIntentMap {
    address public steward;

    struct CivicIntent {
        string department;
        string projectName;
        uint256 budget;
        string symbolicIntent;
        string timestamp;
        string citizenComment;
    }

    CivicIntent[] public intents;

    event IntentMapped(string department, string symbolicIntent);

    constructor() {
        steward = msg.sender;
    }

    function mapIntent(
        string memory _department,
        string memory _projectName,
        uint256 _budget,
        string memory _symbolicIntent,
        string memory _timestamp,
        string memory _citizenComment
    ) public {
        intents.push(CivicIntent(
            _department,
            _projectName,
            _budget,
            _symbolicIntent,
            _timestamp,
            _citizenComment
        ));
        emit IntentMapped(_department, _symbolicIntent);
    }

    function getIntent(uint256 _index) public view returns (CivicIntent memory) {
        require(_index < intents.length, "Invalid index");
        return intents[_index];
    }
}
