contract AllianceReadinessProtocol {
    address public steward = msg.sender;
    mapping(address => bool) public registeredAllies;
    mapping(string => bool) public strategicTargets;
    bool public palantirLinkActive = false;

    event AllyRegistered(address ally);
    event CounterplayActivated(address ally, string target);
    event PalantirSync(string status);
    event DefensiveModeEngaged(address ally);

    function registerAlly(address ally) public {
        registeredAllies[ally] = true;
        emit AllyRegistered(ally);
    }

    function activateCounterplay(address ally, string memory target) public {
        require(registeredAllies[ally], "Ally not registered");
        strategicTargets[target] = true;
        emit CounterplayActivated(ally, target);
    }

    function engageDefensiveMode(address ally) public {
        require(registeredAllies[ally], "Ally not registered");
        emit DefensiveModeEngaged(ally);
    }

    function syncPalantirLink() public {
        palantirLinkActive = true;
        emit PalantirSync("Palantir intelligence link activated. Strategic overlays online.");
    }
}
