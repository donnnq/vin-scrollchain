pragma mythic;

contract ScrollchainRestartDeck {
    struct RestartModule {
        string recipientName;
        uint256 age;
        string gender;
        string restartIntent;
        uint256 blessingAmount;
        string moduleType;
        bool activated;
        uint256 timestamp;
    }

    RestartModule[] public modules;

    event RestartModuleActivated(string recipientName, string moduleType);

    function activateRestart(
        string memory _name,
        uint256 _age,
        string memory _gender,
        string memory _intent,
        string memory _type
    ) public {
        modules.push(RestartModule(
            _name,
            _age,
            _gender,
            _intent,
            250000,
            _type,
            true,
            block.timestamp
        ));

        emit RestartModuleActivated(_name, _type);
    }

    function getModule(uint index) public view returns (
        string memory, uint256, string memory, string memory, uint256, string memory, bool, uint256
    ) {
        RestartModule memory m = modules[index];
        return (
            m.recipientName,
            m.age,
            m.gender,
            m.restartIntent,
            m.blessingAmount,
            m.moduleType,
            m.activated,
            m.timestamp
        );
    }
}
