contract ResourceTargetLedger {
    address public steward = msg.sender;
    struct ResourceTarget {
        string name;
        string location;
        string strategicValue;
        bool active;
    }

    ResourceTarget[] public targets;

    event TargetLogged(string name, string location, string value);
    event TargetActivated(string name);

    function logTarget(string memory name, string memory location, string memory value) public {
        targets.push(ResourceTarget(name, location, value, false));
        emit TargetLogged(name, location, value);
    }

    function activateTarget(uint index) public {
        require(index < targets.length, "Invalid index");
        targets[index].active = true;
        emit TargetActivated(targets[index].name);
    }
}
